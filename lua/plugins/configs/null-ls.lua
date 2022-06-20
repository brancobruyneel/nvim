local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {
  -- diagnostics
  b.diagnostics.eslint_d,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- code actions
  b.code_actions.eslint_d,

  -- formatting
  -- b.formatting.eslint_d,
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "json",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "scss",
      "css",
      "markdown",
    },
  },
  b.formatting.rustfmt.with {
    extra_args = function(params)
      local Path = require "plenary.path"
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  },
  b.formatting.stylua,

  b.formatting.shfmt,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]]
      end
    end,
  }
end

return M
