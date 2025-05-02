return {
  "lua_ls",
  lsp = {
    filetypes = { "lua" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        formatters = { ignoreComments = true },
        telemetry = { enabled = false },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
          },
        },
      },
    },
  },
}
