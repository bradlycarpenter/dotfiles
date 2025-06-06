return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'VeryLazy',
  config = function()
    vim.cmd [[
  highlight! link RainbowDelimiterRed      Identifier
  highlight! link RainbowDelimiterYellow   Type
  highlight! link RainbowDelimiterBlue     Keyword
  highlight! link RainbowDelimiterOrange   Constant
  highlight! link RainbowDelimiterGreen    String
  highlight! link RainbowDelimiterViolet   Function
  highlight! link RainbowDelimiterCyan     Statement
]]
  end,
}
