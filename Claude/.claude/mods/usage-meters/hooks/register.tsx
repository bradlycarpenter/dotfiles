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

// The engine draws the permission-mode label (not reported to SessionMode hooks)
// before this row and a trailing item of its own after it, all on one line; a
// row that leaves the trailing item no room wraps it onto a second line as a
// stray `·`. The mode label is assumed when the hint mentions shift+tab, sized
// for "⏵⏵ accept edits on"; the wider bypass-permissions label still overflows.
const MODE_LABEL = 20
const ROW_SLACK = 6

export const rowWidthFor = (columns: number, hint: string) =>
  Math.max(0, columns - ROW_SLACK - (hint.includes('shift+tab') ? MODE_LABEL : 0))

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

  on('ui.render', { component: 'PromptHint' }, async ($, e, next) => {
    const current = await read($, meters)
    if (current.length === 0) return next(e)

    const { Box, Text } = $.ui.resolve(e)
    const now = await $.clock.now()
    const width = 10
    const rowWidth = e.viewport ? rowWidthFor(e.viewport.columns, e.props.hint) : undefined

    return (
      <Box flexDirection="row" columnGap={3} height={1} overflow="hidden" width={rowWidth}>
        <Box flexGrow={rowWidth === undefined ? 0 : 1} flexShrink={1} minWidth={0}>
          {e.props.hint.trim() ? <Text dimColor wrap="truncate-end">{e.props.hint}</Text> : null}
        </Box>
        {current.map(m => {
          const filled = Math.round((Math.min(m.percent, 100) / 100) * width)
          const reset = until(m.resetsAt, now)
          return (
            <Box key={m.label} flexDirection="row" columnGap={1} flexShrink={0}>
              <Text dimColor>{m.label}</Text>
              <Text>
                <Text color={tone(m.percent)}>{'━'.repeat(filled)}</Text>
                <Text color="subtle">{'─'.repeat(width - filled)}</Text>
              </Text>
              <Text color={tone(m.percent)} bold={m.percent >= 85}>{Math.round(m.percent)}%</Text>
              {reset ? <Text dimColor>󰦛 {reset}</Text> : null}
            </Box>
          )
        })}
      </Box>
    )
  })
}
