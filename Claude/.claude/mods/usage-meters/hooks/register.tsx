import { atom, read, update } from 'claude-code'
import type { Register, SessionContextUsage, SessionRateLimit } from 'claude-code'

import type { Meter } from '../types'

const meters = atom({ plugin: 'usage-meters', key: 'meters' } as const, [])

export const toMeters = (context: SessionContextUsage, rateLimits: readonly SessionRateLimit[]): Meter[] => [
  ...(context.percent === undefined ? [] : [{ label: '󰍛', percent: context.percent }]),
  ...rateLimits
    .filter(r => r.kind === 'five_hour')
    .map(r => ({ label: '󰔟', percent: r.percentUsed, resetsAt: r.resetsAt })),
]

export const tone = (percent: number) => (percent >= 85 ? 'error' : percent >= 60 ? 'warning' : 'success')

export const until = (resetsAt: string | undefined, now: number) => {
  if (!resetsAt) return ''
  const minutes = Math.max(0, Math.round((Date.parse(resetsAt) - now) / 60000))
  if (minutes < 60) return `${minutes}m`
  if (minutes < 48 * 60) return `${Math.floor(minutes / 60)}h${String(minutes % 60).padStart(2, '0')}`
  return `${Math.round(minutes / 1440)}d`
}

export const register: Register = on => {
  on('session.start', async ($, e, next) => {
    const result = await next(e)
    const usage = await $.session.usage()
    await update($, meters, () => toMeters(usage.context, usage.rateLimits))
    return result
  })

  on('session.measure', async ($, e, next) => {
    await update($, meters, () => toMeters(e.context, e.rateLimits))
    return next(e)
  })

  on('ui.render', { component: 'SessionMode' }, async ($, e, next) => {
    const current = await read($, meters)
    if (current.length === 0) return next(e)

    const { Box, Text } = $.ui.resolve(e)
    const now = await $.clock.now()
    const width = 10

    // Absolute so the footer never wraps the meters to a row of their own; they
    // paint over the hint's tail when narrow, hence spaces rather than gaps.
    // right={-2} cancels the footer's right padding.
    return (
      <Box width={0} height={1}>
        <Box position="absolute" right={-2} height={1} flexShrink={0}>
          <Text wrap="truncate-start">
            {e.props.modes.length ? <Text dimColor>{`   ${e.props.modes.join(' & ')}`}</Text> : null}
            {current.map(m => {
              const filled = Math.round((Math.min(m.percent, 100) / 100) * width)
              const reset = until(m.resetsAt, now)
              return (
                <Text key={m.label}>
                  <Text dimColor>{`   ${m.label} `}</Text>
                  <Text color={tone(m.percent)}>{'━'.repeat(filled)}</Text>
                  <Text color="subtle">{'─'.repeat(width - filled)}</Text>
                  <Text color={tone(m.percent)} bold={m.percent >= 85}>{` ${Math.round(m.percent)}%`}</Text>
                  {reset ? <Text dimColor>{` 󰦛 ${reset}`}</Text> : null}
                </Text>
              )
            })}
          </Text>
        </Box>
      </Box>
    )
  })
}
