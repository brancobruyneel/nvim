vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

require("lze").register_handlers(require("lzextras").lsp)

require "branco.keymaps"
require "branco.autocmds"
require "branco.options"

require "branco.ui"
require "branco.lsp"
require "branco.misc"
require "branco.ai"

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
