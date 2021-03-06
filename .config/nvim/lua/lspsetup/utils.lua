local M = {}

M.reset_config = function()
  require('plenary.reload').reload_module('lspsetup')
  require('lspsetup')
  vim.cmd('e')
end

-- Taken from https://github.com/neovim/neovim/blob/569e75799d7015b15631c80cee1feec561f29df7/runtime/lua/vim/lsp/callbacks.lua
M.execute_action = function(action_chosen)
  if action_chosen.edit or type(action_chosen.command) == "table" then
    if action_chosen.edit then
      vim.lsp.util.apply_workspace_edit(action_chosen.edit)
    end
    if type(action_chosen.command) == "table" then
      vim.lsp.buf.execute_command(action_chosen.command)
    end
  else
    vim.lsp.buf.execute_command(action_chosen)
  end
end

return M
