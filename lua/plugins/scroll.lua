return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    require("neoscroll").setup({
      easing_function = "sine",
    })
  end,
}
