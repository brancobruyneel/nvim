vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
vim.g.mapleader = " "

require "branco.keymaps"
require "branco.autocmds"
require "branco.options"

local lze = require "lze"

lze.register_handlers(require("lzextras").lsp)

lze.load {
  { import = "branco.ui" },
  { import = "branco.completions" },
  { import = "branco.git" },
  { import = "branco.lsp" },
  { import = "branco.debug" },
  { import = "branco.ai" },
  { import = "branco.testing" },
}

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
