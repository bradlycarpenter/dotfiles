return {
  {
    'Shatur/neovim-ayu',
    name = 'ayu',
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup {
        terminal = true,
      }
      vim.cmd.colorscheme 'ayu'
    end,
  },
}
