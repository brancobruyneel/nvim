return {
  {
    "git-worktree.nvim",
    keys = {
      {
        "<leader>gw",
        function()
          require("telescope").load_extension "git_worktree"
          require("telescope").extensions.git_worktree.git_worktree()
        end,
        desc = "switch worktree",
      },
      {
        "<leader>gW",
        function()
          require("telescope").load_extension "git_worktree"
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "create worktree",
      },
    },
  },
}
