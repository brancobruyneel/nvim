require("lze").load {
  "base46",
  after = function(_)
    require("base46").load_all_highlights()
  end,
}
