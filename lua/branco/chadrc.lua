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
