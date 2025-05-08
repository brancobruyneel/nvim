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
    "dap",
    "blink",
    "lsp",
    "syntax",
    "semantic_tokens",
    "nvimtree",
    "telescope",
    "git",
    "avante",
    "render-markdown",
  },
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
}

return M
