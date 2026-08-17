vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
vim.g.mapleader = " "

require "branco.keymaps"
require "branco.autocmds"
require "branco.options"

local lze = require "lze"
local lzextras = require "lzextras"

lze.register_handlers(lzextras.lsp)

-- Servers that declare no filetypes lazy-load on the ones nvim-lspconfig ships
-- for them, so the trigger list never drifts from the server's real defaults.
lzextras.lsp.lib.set_ft_fallback(function(name)
  local lspconfig = nixCats.pawsible { "allPlugins", "start", "nvim-lspconfig" }
  local ok, config = pcall(dofile, lspconfig .. "/lsp/" .. name .. ".lua")
  if not ok or type(config) ~= "table" then
    return nil
  end
  return config.filetypes
end)

lze.load {
  { import = "branco.ui" },
  { import = "branco.completions" },
  { import = "branco.git" },
  { import = "branco.lsp" },
  { import = "branco.debug" },
  { import = "branco.ai" },
  { import = "branco.testing" },
  { import = "branco.misc" },
}

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
