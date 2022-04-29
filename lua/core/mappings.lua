local utils = require "core.utils"

local map = utils.map

local cmd = vim.cmd

local M = {}

M.general = function()
  -- unbind
  map("n", "H", "")
  map("n", "L", "")

  -- navigation between windows
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-l>", "<C-w>l")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-j>", "<C-w>j")

  -- clipboard
  map("n", "<leader>y", '"+y')
  map("v", "<leader>y", '"+y')
  map("n", "<C-a>", ":%y+ <CR>")
  -- Don't copy the replaced text after pasting in visual mode
  map("v", "p", '"_dP')

  -- use ESC to turn off search highlighting
  map("n", "<Esc>", ":noh <CR>")

  map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
end

M.packer = function()
  -- Add Packer commands because we are not loading it at startup
  cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
  cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
  cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
  cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
  cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
  cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
end

M.lspconfig = function()
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action() <CR>")
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  map("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>")
  map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

M.nvimtree = function()
  map("n", "<leader>ne", ":NvimTreeToggle <CR>")
  map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.telescope = function()
  map("n", "<C-p>", ":Telescope find_files <CR>")
  map("n", "<leader>fp", ":Telescope buffers <CR>")
  map("n", "<leader>fd", ":Telescope diagnostics <CR>")
  map("n", "<leader>cm", ":Telescope git_commits <CR>")
  map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
  map("n", "<leader>fh", ":Telescope help_tags <CR>")
  map("n", "<leader>fw", ":Telescope live_grep <CR>")
  map("n", "<leader>fo", ":Telescope oldfiles <CR>")
end

M.telescope_media = function()
  map("n", "<leader>fp", ":Telescope media_files <CR>")
end

M.bufferline = function()
  map("n", "<Tab>", "<cmd> :BufferLineCycleNext <CR>")
  map("n", "<S-Tab>", "<cmd> :BufferLineCyclePrev <CR>")
  map("n", "<leader>x", ":lua require('core.utils').close_buffer() <CR>")
end

return M
