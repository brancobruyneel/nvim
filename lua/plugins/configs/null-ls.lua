local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {
   b.formatting.prettierd,

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- Rust
   b.formatting.rustfmt.with { extra_args = { "--edition=2021" } },
}

local M = {}

M.setup = function(on_attach)
   null_ls.setup {
      debug = true,
      sources = sources,
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
   }

end

return M
