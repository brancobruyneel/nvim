return {
  {

    "render-markdown.nvim",
    after = function()
      require("render-markdown").setup {
        file_types = { "markdown" },
      }
    end,
    ft = { "markdown", "Avante" },
  },
  {
    "peek.nvim",
    after = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
