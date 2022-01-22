local M = {}

M.autopairs = function()
   local present1, autopairs = pcall(require, "nvim-autopairs")
   local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

   if present1 and present2 then
      autopairs.setup({ fast_wrap = {} })

      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
   end
end

M.blankline = function()
  require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

M.colorizer = function()
  local present, colorizer = pcall(require, "colorizer")
  if present then
    colorizer.setup({ "*" }, {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = false, -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes
      rgb_fn = false, -- CSS rgb() and rgba() functions
      hsl_fn = false, -- CSS hsl() and hsla() functions
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn

      -- Available modes: foreground, background
      mode = "background", -- Set the display mode.
    })
  end
end

M.luasnip = function()
   local present, luasnip = pcall(require, "luasnip")
   if present then
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged, TextChangedI",
      })
      require("luasnip/loaders/from_vscode").load()
   end
end

M.gitsigns = function()
   local present, gitsigns = pcall(require, "gitsigns")
   if present then
      local default = {
         signs = {
            add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
            change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
            delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
            topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
            changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
         },
      }
      gitsigns.setup(default)
   end
end

return M
