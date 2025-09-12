return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- or "latte", "frappe", "macchiato"
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false, -- shows ~ at the end of buffers
      term_colors = true,
      dim_inactive = {
        enabled = false,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        bufferline = true,
        gitsigns = true,
        lsp_trouble = true,
        nvimtree = true,
        treesitter = true,
        which_key = true,
        telescope = true,
        mason = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
