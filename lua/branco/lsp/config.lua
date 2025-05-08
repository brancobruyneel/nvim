local x = vim.diagnostic.severity

vim.diagnostic.config {
  underline = false,
  virtual_text = false,
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  float = {
    show_header = true,
    source = "if_many",
    border = "rounded",
    focusable = false,
  },
  update_in_insert = true,
  severity_sort = true,
}

require("lze").load {
  {
    "nvim-lspconfig",
    on_require = "lspconfig",
    keys = {
      { "<leader>ra", require "nvchad.lsp.renamer", "Rename" },
      { "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
      { "K", vim.lsp.buf.hover, "Hover Documentation" },
      { "<c-k>", vim.lsp.buf.signature_help, "Signature Documentation" },
      { "ge", vim.diagnostic.open_float, "Show diagnostics" },
      { "gD", vim.lsp.buf.declaration, "Go to declartion" },
      { "gd", vim.lsp.buf.definition, "Go to definition" },
    },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function()
      vim.lsp.config("*", {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end,
  },
  { import = "branco.lsp.servers" },
}
