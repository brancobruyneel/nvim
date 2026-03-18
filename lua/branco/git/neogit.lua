return {
  {
    "neogit",
    after = function(_)
      require("neogit").setup {
        signs = { section = { "", "" }, item = { "", "" } },
        integrations = { diffview = true },
        keys = {
          { "<leader>go", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
        },
      }
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
  },
}
