return {
  {
    'loctvl842/monokai-pro.nvim',
    name = 'monokai-pro',
    lazy = false,
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        filter = 'spectrum',
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  },
}
