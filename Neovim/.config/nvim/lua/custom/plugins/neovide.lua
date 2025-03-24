return {
  'neovide/neovide',
  config = function()
    vim.g.neovide_title_background_color = '#282828'
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_cursor_animation_length = 0
    vim.o.guifont = 'JetBrainsMono NF:h12'
    vim.g.neovide_refresh_rate = 140
  end,
}
