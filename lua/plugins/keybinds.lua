-- lua/plugins/whichkey.lua
-- Based on folke/which-key.nvim v3+ spec (uses `win`, `filter`, `triggers`, and `which-key.add`)
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- plugins
    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    -- icons & formatting (keeps the defaults from the README)
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
      ellipsis = "…",
      mappings = true,
      rules = {},
      colors = true,
      keys = {}, -- use defaults (you can add custom key icons here)
    },

    -- window options (new key: `win`)
    win = {
      no_overlap = true,
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      bo = {}, -- extra buffer options if needed
      wo = {}, -- extra window options (e.g. winblend)
    },

    -- layout (keep sensible defaults)
    layout = {
      width = { min = 20 },
      spacing = 3,
    },

    -- filter replacing old `ignore_missing` behaviour:
    -- hide mappings that don't have a description (same intent as old ignore_missing = true)
    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ""
    end,

    -- key scrolling inside the popup
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },

    -- show keys/help in commandline (follow README defaults; change if you prefer)
    show_help = true,
    show_keys = true,

    -- triggers: use the official default format (don't use a plain string "auto")
    triggers = {
      { "<auto>", mode = "nxso" },
    },

    -- keep spec empty here (we add with wk.add in config)
    spec = {},
  },

  config = function(_, opts)
    local wk_ok, wk = pcall(require, "which-key")
    if not wk_ok then
      vim.notify("which-key not available", vim.log.levels.WARN)
      return
    end

    -- apply setup (safe)
    wk.setup(opts)

    -- add group headers using the new mapping spec (flat list)
    wk.add({
      { "<leader>f", group = "Telescope" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>b", group = "Buffers" },
      { "<leader>c", group = "Code" },
      { "<leader>s", group = "Split" },
    })
  end,
}
