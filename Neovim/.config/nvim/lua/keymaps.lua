-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab Navigation
vim.keymap.set('n', 'H', 'gT', { desc = 'Go to previous tab' })
vim.keymap.set('n', 'L', 'gt', { desc = 'Go to next tab' })

-- Resize
vim.keymap.set('n', '<A-h>', ':vertical resize -2<CR>', { desc = 'Shrink window horizontally', silent = true })
vim.keymap.set('n', '<A-l>', ':vertical resize +2<CR>', { desc = 'Expand window horizontally', silent = true })
vim.keymap.set('n', '<A-j>', ':resize -2<CR>', { desc = 'Shrink window vertically', silent = true })
vim.keymap.set('n', '<A-k>', ':resize +2<CR>', { desc = 'Expand window vertically', silent = true })

-- Move Windows
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set('n', '<leader>lg', require('config.lazygit').toggle, {
  desc = 'Toggle [L]azy[G]it',
  noremap = true,
  silent = true,
})

-- Open Netrw
vim.keymap.set("n", "\\", ":Ex<CR>", { desc = "Open netrw file explorer" })

-- vim: ts=2 sts=2 sw=2 et
