return {
  "blink.cmp",
  event = "DeferredUIEnter",
  on_require = "blink",
  after = function(_)
    require("blink.cmp").setup {
      cmdline = { enabled = true },
      appearance = { nerd_font_variant = "normal" },
      fuzzy = { implementation = "prefer_rust" },
      sources = { default = { "lsp", "buffer", "path" } },

      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "single" },
        },

        accept = { auto_brackets = { enabled = true } },

        menu = require("nvchad.blink").menu,
      },
    }
  end,
}
