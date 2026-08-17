local x = vim.diagnostic.severity

vim.diagnostic.config {
  underline = false,
  virtual_text = false,
  virtual_lines = { current_line = true },
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  float = {
    show_header = true,
    source = "if_many",
    focusable = false,
  },
  severity_sort = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("branco.lsp.attach", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- inline colour swatches, replaces a colorizer plugin
    if client:supports_method "textDocument/documentColor" then
      vim.lsp.document_color.enable(true, { bufnr = args.buf })
    end

    -- rename paired tags (jsx/html) as you type
    if client:supports_method "textDocument/linkedEditingRange" then
      vim.lsp.linked_editing_range.enable(true, { client_id = client.id })
    end
  end,
})

return {
  {
    "nvim-lspconfig",
    on_require = "lspconfig",
    keys = {
      { "<leader>ra", require "nvchad.lsp.renamer", "Rename" },
      { "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
      { "ge", vim.diagnostic.open_float, "Show diagnostics" },
      { "gD", vim.lsp.buf.declaration, "Go to declartion" },
      { "gd", vim.lsp.buf.definition, "Go to definition" },
    },
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
  },
  { import = "branco.lsp.servers" },
}
