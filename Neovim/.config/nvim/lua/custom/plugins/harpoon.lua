return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED: Initialize harpoon
    harpoon:setup()

    local list = harpoon:list()
    local ui = harpoon.ui

    -- Add current buffer to Harpoon
    vim.keymap.set('n', '<leader>a', function()
      list:add()
    end, { desc = 'Harpoon Add File' })

    -- Toggle quick menu
    vim.keymap.set('n', '<A-e>', function()
      ui:toggle_quick_menu(list)
    end, { desc = 'Harpoon Menu' })

    -- Jump to Harpoon slots using Alt+1 through Alt+4
    vim.keymap.set('n', '<A-1>', function()
      list:select(1)
    end, { desc = 'Harpoon File 1' })
    vim.keymap.set('n', '<A-2>', function()
      list:select(2)
    end, { desc = 'Harpoon File 2' })
    vim.keymap.set('n', '<A-3>', function()
      list:select(3)
    end, { desc = 'Harpoon File 3' })
    vim.keymap.set('n', '<A-4>', function()
      list:select(4)
    end, { desc = 'Harpoon File 4' })
    vim.keymap.set('n', '<A-5>', function()
      list:select(5)
    end, { desc = 'Harpoon File 5' })

    -- Cycle through Harpoon list
    vim.keymap.set('n', '<A-p>', function()
      list:prev()
    end, { desc = 'Harpoon Prev' })
    vim.keymap.set('n', '<A-n>', function()
      list:next()
    end, { desc = 'Harpoon Next' })
  end,
}
