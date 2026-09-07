local M = {}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

-- base46's git/diffview integrations blend the diff backgrounds ~10% into the
-- theme bg, which leaves hunks and (with diffopt=inline:char) intra-line changes
-- nearly invisible. Push the blends until they actually read as add/change/delete.
M.base46 = {
  hl_override = {
    DiffAdd = { fg = "NONE" },
    DiffDelete = { fg = "NONE" },

    -- these two also need a real bg: base46 lands them within 8/255 of the normal
    -- bg, so changed lines and diffopt=inline:char's intra-line runs don't show up
    DiffChange = { fg = "NONE" },
    DiffText = { fg = "NONE" },

    -- dims the ╱ filler lines, which base46 tints red
    DiffviewDiffDeleteDim = { fg = "grey", bg = "NONE" },
  },

  integrations = {
    "dap",
    "blink",
    "lsp",
    "syntax",
    "semantic_tokens",
    "nvimtree",
    "telescope",
    "git",
    "neogit",
    "diffview",
    "avante",
    "render-markdown",
  },
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
}

return M
