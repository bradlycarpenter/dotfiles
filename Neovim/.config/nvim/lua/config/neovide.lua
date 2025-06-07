vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_vfx_mode = ''
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animate_in_insert_mode = false
-- vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_font_size = 12

local function update_font_size()
  vim.opt.guifont = { 'CaskaydiaCove Nerd Font', ':h' .. vim.g.neovide_font_size }
end

update_font_size()

vim.keymap.set('n', '<C-=>', function()
  vim.g.neovide_font_size = vim.g.neovide_font_size + 1
  update_font_size()
end, { desc = 'Increase font size' })

vim.keymap.set('n', '<C-->', function()
  vim.g.neovide_font_size = vim.g.neovide_font_size - 1
  update_font_size()
end, { desc = 'Decrease font size' })

vim.keymap.set('n', '<C-0>', function()
  vim.g.neovide_font_size = 12
  update_font_size()
end, { desc = 'Reset font size' })
