return {
  {

    "nvim-lint",
    event = "BufReadPost",
    after = function()
      local lint = require "lint"

      -- js and ts are absent on purpose: eslint runs as a language server
      lint.linters_by_ft = {
        go = { "golangcilint" },
        dockerfile = { "hadolint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
