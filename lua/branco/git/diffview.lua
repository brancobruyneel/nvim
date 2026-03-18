return {
  {
    "diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    on_require = "diffview",
    after = function(_)
      require("diffview").setup {
        default_args = {
          DiffviewOpen = { "--imply-local" },
        },
        keymaps = {
          view = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
          },
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
          },
          file_history_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
          },
        },
      }
      dofile(vim.g.base46_cache .. "diffview")
    end,
  },
}
