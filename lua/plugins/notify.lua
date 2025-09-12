return {
  "rcarriga/nvim-notify",
  event = "VeryLazy", -- lazy load
  opts = {
    timeout = 3000,        -- 3 seconds
    max_height = 10,
    max_width = 80,
    stages = "fade",       -- fade in/out animation
    render = "minimal",    -- clean look
  },
  init = function()
    vim.notify = require("notify")  -- replace default vim.notify
  end,
}
