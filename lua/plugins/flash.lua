return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "z", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "Z", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  }
}