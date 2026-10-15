import type { Register } from 'claude-code'

const POLL_MS = 15_000

const THEME_CHANGED = '\x1b[?997;1n'

export const register: Register = on => {
  let poll: { cancel: () => void } | undefined

  on('session.start', async ($, e, next) => {
    const started = await next(e)
    const paneId = await $.env.get('HERDR_PANE_ID')
    if (!e.isInteractive || e.surface !== 'terminal' || !paneId) return started

    poll?.cancel()
    poll = $.clock.every(POLL_MS, () => {
      $.process
        .run(['herdr', 'pane', 'send-text', paneId, THEME_CHANGED], { timeoutMs: 5_000 })
        .catch(() => {})
    })
    return started
  })

  on('session.end', ($, e, next) => {
    poll?.cancel()
    poll = undefined
    return next(e)
  })
}
