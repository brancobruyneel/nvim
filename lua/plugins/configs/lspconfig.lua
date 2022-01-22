local function attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  require("core.mappings").lspconfig()
end

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = true,

})

local lsp_installer = require "nvim-lsp-installer"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


local enhance_server_opts = {
  ["sumneko_lua"] = function(opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
      },
    }
  end,

  ["tailwindcss"] = function (opts)
    opts.filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "rust"}
    opts.init_options = {
      userLanguages = {
        rust = "html",
      }
    }
  end
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
