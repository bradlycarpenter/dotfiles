return {
  'windwp/nvim-ts-autotag',
  opts = {},
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  event = 'InsertEnter',
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
