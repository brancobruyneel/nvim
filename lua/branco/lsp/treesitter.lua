require("lze").load {
  {
    "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    before = function(_)
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
    end,
    after = function(_)
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          use_language_tree = true,
        },
        indent = { enable = false },
      }
    end,
  },
}
