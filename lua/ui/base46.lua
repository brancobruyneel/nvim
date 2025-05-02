require("lze").load({
  "nvchad/base46",
  lazy = true,
  after = function(_)
    require("base46").load_all_highlights()
  end,
})
