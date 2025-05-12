return {
  {
    "nvchad-ui",
    lazy = false,
    after = function(_)
      require "nvchad"
    end,
  },
  {
    "base46",
    after = function(_)
      require("base46").load_all_highlights()
    end,
  },
}
