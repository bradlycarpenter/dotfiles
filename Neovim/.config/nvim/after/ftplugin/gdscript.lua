vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = false

local port = tonumber(os.getenv 'GDScript_Port') or 6005
vim.lsp.start {
  name = 'Godot',
  cmd = { 'ncat', '127.0.0.1', tostring(port) },
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
}
