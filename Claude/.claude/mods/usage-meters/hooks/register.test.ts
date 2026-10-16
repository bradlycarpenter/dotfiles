import { expect, test } from 'claude-code/testing'
import { rowWidthFor, toMeters, tone, until } from './register'

test('builds meters from context and rate limits', () => {
  const m = toMeters({ window: 200000, tokens: 84000, percent: 42 }, [
    { kind: 'five_hour', percentUsed: 18.5, resetsAt: '2026-10-16T15:00:00Z' },
    { kind: 'seven_day', percentUsed: 91 },
  ])
  expect(m.map(x => [x.label, x.percent])).toEqual([['󰍛', 42], ['󰔟', 18.5]])
})

test('skips context before the first response', () => {
  expect(toMeters({ window: 200000 }, [])).toEqual([])
})

test('tones and reset countdowns', () => {
  expect([tone(10), tone(70), tone(90)]).toEqual(['success', 'warning', 'error'])
  const now = Date.parse('2026-10-16T12:00:00Z')
  expect(until('2026-10-16T12:45:00Z', now)).toBe('45m')
  expect(until('2026-10-16T15:05:00Z', now)).toBe('3h05')
  expect(until('2026-10-20T12:00:00Z', now)).toBe('4d')
})

test('row leaves room for the mode label and trailing item', () => {
  expect(rowWidthFor(125, '(shift+tab to cycle) · ← for agents')).toBe(99)
  expect(rowWidthFor(125, '? for shortcuts')).toBe(119)
})
