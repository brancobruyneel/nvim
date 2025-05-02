vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

require("lze").register_handlers(require("lzextras").lsp)

require "keymaps"
require "autocmds"
require "options"

require "ui"
require "lsp"
require "misc"

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
