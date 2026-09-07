return {
  {
    "diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff working tree" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "file history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "repo history" },
    },
    on_require = "diffview",
    after = function(_)
      require("diffview").setup {
        -- remaps DiffAdd to a red "add as delete" in the left window and dims
        -- the filler lines, so deletions read as deletions instead of additions
        enhanced_diff_hl = true,
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
