return {
  {
    "auto-dark-mode-nvim",
    event = "DeferredUIEnter",
    after = function(_)
      local function set_theme(theme)
        if require("nvconfig").base46.theme == theme then
          return
        end
        require("nvchad.themes.utils").reload_theme(theme)
      end

      require("auto-dark-mode").setup {
        set_dark_mode = function()
          vim.o.background = "dark"
          set_theme "onedark"
        end,
        set_light_mode = function()
          vim.o.background = "light"
          set_theme "one_light"
        end,
      }
    end,
  },
}
