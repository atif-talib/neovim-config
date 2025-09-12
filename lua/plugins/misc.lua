-- Essential standalone plugins (auto-pairs, Git, UI, etc.)
return {
  -- devicons
  {
    'nvim-tree/nvim-web-devicons', 
    opts = {}
  },

  -- comments
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },

  -- Heuristically set buffer options
  {
    'tpope/vim-sleuth',
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.pairs').setup()

      -- local statusline = require("mini.statusline")
      -- statusline.setup({
      --   use_icons = vim.g.have_nerd_font,
      -- })
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return "%2l:%-2v"
      -- end
    end,
  },

  {
    'echasnovski/mini.icons',
    enabled = true,
    opts = {},
    lazy = true,
  },

  -- 🖍️ Highlight hex/rgb/hsl colors inline
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- ✅ Highlight and list TODO, FIXME, etc.
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
