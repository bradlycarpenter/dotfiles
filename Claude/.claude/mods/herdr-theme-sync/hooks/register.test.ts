import { test, expect, mock } from 'claude-code/testing'

const start = { cwd: '/tmp', surface: 'terminal', isInteractive: true } as const
const ran = { exitCode: 0, stdout: '', stderr: '', isStdoutTruncated: false, isStderrTruncated: false }

test('pokes its own herdr pane every 15s', async ($, on) => {
  const clock = mock.clock(on)
  on('session.start', ($, e) => ({ cwd: e.cwd }))
  mock.env(on, { HERDR_PANE_ID: 'w1:p3' })
  const runs: (readonly string[])[] = []
  on('process.run', ($, e) => {
    runs.push(e.argv)
    return { value: ran }
  })

  await $.session.start(start)
  await clock.advance(14_999)
  expect(runs.length).toBe(0)
  await clock.advance(1)
  expect(runs).toEqual([['herdr', 'pane', 'send-text', 'w1:p3', '\x1b[?997;1n']])
  await clock.advance(15_000)
  expect(runs.length).toBe(2)
})

test('stays idle outside herdr or without a terminal', async ($, on) => {
  const clock = mock.clock(on)
  on('session.start', ($, e) => ({ cwd: e.cwd }))
  mock.env(on, {})
  let runs = 0
  on('process.run', () => {
    runs++
    return { value: ran }
  })

  await $.session.start(start)
  await $.session.start({ ...start, surface: null, isInteractive: false })
  await clock.advance(60_000)
  expect(runs).toBe(0)
})
