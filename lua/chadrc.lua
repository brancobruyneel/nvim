-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
--  diff_add = "#31392b",
-- 	diff_delete = "#382b2c",
-- 	diff_change = "#1c3448",
-- 	diff_text = "#2c5372",

---@class ChadrcConfig
local M = {}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
  lsp = { signature = true },
}

M.base46 = {
  integrations = {
    "neogit",
    "notify",
  },
  theme = "onedark",
}

return M
