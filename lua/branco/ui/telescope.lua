local function tf(cmd, opts)
  return function()
    return require("telescope.builtin")[cmd](opts or {})
  end
end

require("lze").load {
  "telescope.nvim",
  dependencies = { "plenary.nvim", "telescope-fzf-native-nvim" },
  keys = {
    { "<C-p>", tf "find_files", desc = "Search Files" },
    { "<leader>fp", tf "buffers", desc = "Search Buffers" },
    { "<leader>fd", tf "diagnostics", desc = "Search Diagnostics (All)" },
    { "<leader>fD", tf("diagnostics", { bufnr = 0 }), desc = "Search Diagnostics (Buffer)" },
    { "<leader>fH", tf "highlights", desc = "Search Highlight Groups" },
    { "<leader>fj", tf "jumplist", desc = "Search Jump List" },
    { "<leader>fk", tf "keymaps", desc = "Search Key Mappings" },
    { "<leader>fl", tf "loclist", desc = "Search Location List" },
    { "<leader>fm", tf "man_pages", desc = "Search Man Pages" },
    { "<leader>fo", tf "oldfiles", desc = "Search Old (Recent) Files" },
    { "<leader>fq", tf "quickfix", desc = "Search Quickfix List" },
    { "<leader>fw", tf "live_grep", desc = "Search Words", mode = { "n", "x" } },
    { "<leader>f.", tf "current_buffer_fuzzy_find", desc = "Search Buffer Lines" },
    { "<leader>f/", tf "search_history", desc = "Search History" },
    { "<leader>f'", tf "marks", desc = "Search Marks" },
    { '<leader>f"', tf "registers", desc = "Search Registers" },
    { "<leader>f<cr>", tf "resume", desc = "Resume Last Search" },
    -- Git
    { "<leader>gb", tf "git_branches", desc = "Search Git Branches" },
    { "<leader>gs", tf "git_status", desc = "Search Git Status" },
    { "<leader>gS", tf "git_stash", desc = "Search Git Stash" },
    { "<leader>gl", tf "git_commits", desc = "Search Git Commits" },
    { "<leader>gf", tf "git_bcommits", desc = "Search Git Buffer Commits" },
    -- LSP
    { "gd", tf "lsp_definitions", desc = "Go to Definition" },
    { "gD", tf "lsp_declarations", desc = "Go to Declaration" },
    { "gr", tf "lsp_references", nowait = true, desc = "Search References" },
    { "gI", tf "lsp_implementations", desc = "Go to Implementation" },
    { "gy", tf "lsp_type_definitions", desc = "Go to Type Definition" },
    -- Miscellaneous
    { "<leader>uC", tf "colorscheme", desc = "Search Colorschemes" },
  },
  before = function(_)
    dofile(vim.g.base46_cache .. "telescope")
  end,
  after = function(_)
    require("telescope").setup {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
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
