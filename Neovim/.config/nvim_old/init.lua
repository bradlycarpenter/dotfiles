vim.api.nvim_create_augroup("FileTypeIndent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cs",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "gdscript",
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.expandtab = true
	end,
})

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.colorcolumn = "81"
vim.opt.signcolumn = "yes"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Highlight When Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Use System Clipboard, requires xclip and gvim on Linux
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

require("config.lazy")
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Open Netrw
vim.keymap.set("n", "\\", ":Explore<CR>", { noremap = true, silent = true })
-- exit Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
