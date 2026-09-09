return {
  {
    "conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format { lsp_fallback = true }
        end,
        desc = "Format Document",
        mode = { "n", "v" },
      },
    },
    after = function()
      local function js_formatter(bufnr)
        local conform = require "conform"
        local path = vim.api.nvim_buf_get_name(bufnr)
        if
          conform.get_formatter_info("biome", bufnr).available
          and vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, path = path })[1]
        then
          return { "biome" }
        end
        return { "prettierd" }
      end

      require("conform").setup {
        formatters = {
          -- yamlfmt drops every blank line by default, rewriting whole CI files
          yamlfmt = { prepend_args = { "-formatter", "retain_line_breaks=true" } },
        },
        formatters_by_ft = {
          lua = { "stylua" },
          go = { "gofumpt", "goimports" },
          nix = { "nixfmt-rfc-style" },
          javascript = js_formatter,
          javascriptreact = js_formatter,
          typescript = js_formatter,
          typescriptreact = js_formatter,
          json = js_formatter,
          jsonc = js_formatter,
          yaml = { "yamlfmt" },
          -- no hcl entry on purpose: every .hcl here is a generated lock file
          terraform = { "tofu_fmt" },
        },
        -- prettierd's first call in a directory starts its daemon; 500ms timed out
        default_format_opts = { timeout_ms = 3000 },
        format_on_save = { lsp_fallback = true },
      }
    end,
  },
}
