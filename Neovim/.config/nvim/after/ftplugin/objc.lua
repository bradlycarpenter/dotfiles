vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

require('guess-indent').set_from_buffer(vim.api.nvim_get_current_buf(), true, true)
