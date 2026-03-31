return {
  {
    "neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "git pull" },
    },
    after = function(_)
      require("neogit").setup {
        signs = { section = { "", "" }, item = { "", "" } },
        integrations = { diffview = true },
      }
      dofile(vim.g.base46_cache .. "git")
      dofile(vim.g.base46_cache .. "neogit")
    end,
  },
}
