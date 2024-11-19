return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    auto_hide = 1,
    clickable = true,
    focus_on_close = 'left',
    animation = false,

    sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = {
        text = 'undotree',
        align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
      },
    },

    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = { event = 'BufWipeout' },
    -- Or, specify all three
    Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released

  -- Move to previous/next buffer
  vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true }), -- Shift+H for previous buffer
  vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true }), -- Shift+L for next buffer
  -- Open a new tab with <leader>t n
  vim.keymap.set('n', '<leader>Tc', '<Cmd>tabnew<CR>', { noremap = true, silent = true, desc = '[C]reate Tab' }),
  -- Close the current tab with <leader>t c
  vim.keymap.set('n', '<leader>Tx', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = 'E[x]it Tab' }),
}
