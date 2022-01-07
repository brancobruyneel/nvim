local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

   -- js/ts
   b.formatting.deno_fmt,

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function(on_attach)
   null_ls.setup {
      debug = true,
      sources = sources,
      on_attach = on_attach
   }
   -- for formatting on save
   -- vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
end

return M
