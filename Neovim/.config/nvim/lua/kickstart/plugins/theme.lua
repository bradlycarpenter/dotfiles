return {
  {
    'loctvl842/monokai-pro.nvim',
    name = 'monokai-pro',
    lazy = false,
    priority = 1000,
    config = function()
      require('monokai-pro').setup {
        transparent_background = true,
        day_night = {
          enable = true,
          day_filter = 'pro',
          night_filter = 'spectrum',
        },
      }

      local gtk_file = vim.fn.expand '~/.config/gtk-4.0/settings.ini'
      local uv = vim.uv

      local function apply_theme()
        local file = io.open(gtk_file, 'r')
        local bg = 'dark' -- default

        if file then
          local content = file:read '*a'
          file:close()
          if content:match 'gtk%-application%-prefer%-dark%-theme=false' then
            bg = 'light'
          end
        end

        vim.o.background = bg
        local colorscheme = (bg == 'light') and 'monokai-pro-light' or 'monokai-pro-spectrum'
        vim.cmd.colorscheme(colorscheme)
      end

      apply_theme()

      local function watch_gtk_file()
        if vim.fn.filereadable(gtk_file) == 0 then
          return
        end

        local handle = uv.new_fs_event()

        local unwatch_cb = function()
          if handle then
            uv.fs_event_stop(handle)
          end
        end

        local function event_cb(err)
          if err then
            print('GTK file watcher error:', err)
            unwatch_cb()
          else
            vim.schedule(function()
              apply_theme()
              unwatch_cb()
              watch_gtk_file() -- Restart watcher
            end)
          end
        end

        if handle then
          uv.fs_event_start(handle, gtk_file, {}, event_cb)
        end

        return handle
      end

      watch_gtk_file()
    end,
  },
}
