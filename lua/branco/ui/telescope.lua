local function tf(cmd, opts)
  return function()
    return require("telescope.builtin")[cmd](opts or {})
  end
end

return {
  "telescope.nvim",
  keys = {
    { "<C-p>", tf "find_files", desc = "Search Files" },
    { "<leader>fp", tf "buffers", desc = "Search Buffers" },
    { "<leader>fd", tf "diagnostics", desc = "Search Diagnostics (All)" },
    { "<leader>fD", tf("diagnostics", { bufnr = 0 }), desc = "Search Diagnostics (Buffer)" },
    { "<leader>fh", tf "help_tags", desc = "Search help pages" },
    { "<leader>fH", tf "highlights", desc = "Search Highlight Groups" },
    { "<leader>fj", tf "jumplist", desc = "Search Jump List" },
    { "<leader>fk", tf "keymaps", desc = "Search Key Mappings" },
    { "<leader>fl", tf "loclist", desc = "Search Location List" },
    { "<leader>fm", tf "man_pages", desc = "Search Man Pages" },
    { "<leader>fo", tf "oldfiles", desc = "Search Old (Recent) Files" },
    { "<leader>fq", tf "quickfix", desc = "Search Quickfix List" },
    { "<leader>fw", tf "live_grep", desc = "Search Words", mode = { "n", "x" } },

    { "<leader>fb", tf "git_branches", desc = "Search Git Branches" },
    { "<leader>gs", tf "git_status", desc = "Search Git Status" },
    { "<leader>gl", tf "git_commits", desc = "Search Git Commits" },
    { "<leader>gf", tf "git_bcommits", desc = "Search Git Buffer Commits" },
  },
  after = function(_)
    require("telescope").setup {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        file_ignore_patterns = { "^vendor/" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },

      extensions_list = { "themes", "terms" },
      extensions = { "fzf" },
    }
  end,
}
