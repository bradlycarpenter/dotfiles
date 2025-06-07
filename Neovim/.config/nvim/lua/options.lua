vim.o.number = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.o.cursorline = true
vim.o.confirm = true
vim.o.scrolloff = 10
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.mouse = 'a'
vim.o.signcolumn = 'yes'
vim.o.inccommand = 'split'
vim.o.colorcolumn = '81'
vim.o.tabstop = 2
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'config.neovide'

-- vim: ts=2 sts=2 sw=2 et
