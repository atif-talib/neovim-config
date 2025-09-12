return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode", -- load only when you call :ZenMode
  opts = {
    window = {
      backdrop = 0.95, -- dim background
      width = 0.6,     -- width of the Zen window
      height = 0.9,    -- height of the Zen window
      options = {
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
      },
      twilight = { enabled = true }, -- dim inactive code (needs folke/twilight.nvim)
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      wezterm = {
        enabled = false,
        font = "+4", -- (10% increase per step)
      },
    },
    on_open = function(win)
      -- optional: disable diagnostics inline
      vim.diagnostic.config({ virtual_text = false })
    end,
    on_close = function()
      -- restore diagnostics
      vim.diagnostic.config({ virtual_text = true })
    end,
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}
