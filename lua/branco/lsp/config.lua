require("lze").load {
  {
    "nvim-lspconfig",
    on_require = "lspconfig",
    keys = {
      { "<leader>rn", vim.lsp.buf.rename, "Rename" },
      { "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
      { "K", vim.lsp.buf.hover, "Hover Documentation" },
      { "<c-k>", vim.lsp.buf.signature_help, "Signature Documentation" },
    },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function()
      dofile(vim.g.base46_cache .. "lsp")

      vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  },
  { import = "branco.lsp.servers" },
}
