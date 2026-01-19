return {
  {
    "nvim-treesitter",
    event = "DeferredUIEnter",
    after = function(_)
      require("nvim-treesitter").setup {
        highlight = {
          enable = true,
          use_language_tree = true,
        },
        indent = { enable = false },
      }
    end,
  },
  {
    "nvim-treesitter-context",
    event = "DeferredUIEnter",
  },
}
