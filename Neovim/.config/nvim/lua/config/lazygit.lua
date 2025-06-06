local M = {}

local term_bufnr = nil
local term_winid = nil
local prev_win = nil

local function is_open()
  return term_winid and vim.api.nvim_win_is_valid(term_winid) or false
end

local function on_exit()
  if is_open() then
    vim.api.nvim_win_close(term_winid, true)
    term_winid = nil
  end
  if term_bufnr and vim.api.nvim_buf_is_valid(term_bufnr) then
    vim.api.nvim_buf_delete(term_bufnr, { force = true })
    term_bufnr = nil
  end
  if prev_win and vim.api.nvim_win_is_valid(prev_win) then
    vim.api.nvim_set_current_win(prev_win)
    prev_win = nil
  end
  pcall(vim.api.nvim_del_augroup_by_name, 'LazyGitFloatFocus')
end

function M.toggle()
  if is_open() then
    on_exit()
    return
  end

  local first_time = false
  if not term_bufnr or not vim.api.nvim_buf_is_valid(term_bufnr) then
    term_bufnr = vim.api.nvim_create_buf(false, true)
    vim.bo[term_bufnr].bufhidden = 'hide'
    first_time = true
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  prev_win = vim.api.nvim_get_current_win()

  term_winid = vim.api.nvim_open_win(term_bufnr, true, {
    relative = 'editor',
    row = row,
    col = col,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
  })

  if first_time then
    vim.fn.termopen('lazygit', {
      buffer = term_bufnr,
      on_exit = function()
        vim.schedule(on_exit)
      end,
    })

    vim.api.nvim_create_augroup('LazyGitFloatFocus', { clear = true })

    -- Hide the window if user switches focus away
    vim.api.nvim_create_autocmd('WinLeave', {
      group = 'LazyGitFloatFocus',
      callback = function()
        if is_open() then
          vim.schedule(on_exit)
        end
      end,
    })
  end

  vim.api.nvim_feedkeys('i', 'n', false)
end

return M
