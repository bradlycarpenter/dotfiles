require('plugins')
vim.o.number = true
vim.o.splitright = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.relativenumber = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.lsp.config['lua_ls'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
}

vim.lsp.config['vts_ls'] = {
	cmd = { 'vtsls', '--stdio' },
	filetypes = { 'typescript', 'typescript-react' },
}

vim.lsp.enable({ 'vts_ls', 'lua_ls' })


vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
