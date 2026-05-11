return {
  {
    "conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          }
        end,
        desc = "Format Document",
        mode = { "n", "v" },
      },
    },
    after = function()
      local function js_formatter(bufnr)
        local conform = require("conform")
        local path = vim.api.nvim_buf_get_name(bufnr)
        if
          conform.get_formatter_info("biome", bufnr).available
          and vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true, path = path })[1]
        then
          return { "biome" }
        end
        return { "prettierd", "prettier", stop_after_first = true }
      end

      require("conform").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          go = { "gofumpt", "goimports" },
          nix = { "nixfmt-rfc-style" },
          javascript = js_formatter,
          typescript = js_formatter,
          terraform = { "terraform_fmt" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      }
    end,
  },
}
