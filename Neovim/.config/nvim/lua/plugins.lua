require("monokai-pro").setup({
  transparent_background = true,
})

require("auto-dark-mode").setup({
  update_interval = 3000,
  fallback = "dark",

  set_dark_mode = function()
    vim.opt.background = "dark"
    require("monokai-pro").setup({
      filter = "spectrum",
    })
    vim.cmd.colorscheme("monokai-pro")
  end,

  set_light_mode = function()
    vim.opt.background = "light"
    require("monokai-pro").setup({
      filter = "light",
    })
    vim.cmd.colorscheme("monokai-pro")
  end,
})

require("auto-dark-mode").init()
