vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"
vim.g.mapleader = " "

require("lze").register_handlers(require("lzextras").lsp)

require "branco.keymaps"
require "branco.autocmds"
require "branco.options"

require "branco.ui"
require "branco.lsp"
require "branco.misc"
require "branco.ai"

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
