local M = {}

M.init = function(theme)
  vim.g.theme = theme

  vim.cmd [[colo onedark]]

  require "colors.highlights"
end

M.get = function()
  return require "colors/themes/onedark"
end

return M
