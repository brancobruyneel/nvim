return {
  {
    "mini.surround",
    keys = { "sa", "sd", "sr", "sf", "sF", "sh", "sn" },
    after = function(_)
      require("mini.surround").setup {}
    end,
  },
}
