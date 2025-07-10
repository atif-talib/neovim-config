-- Essential standalone plugins (auto-pairs, Git, UI, etc.)
return {
  -- 🧠 Auto-detect tabstop & shiftwidth
  { 'tpope/vim-sleuth' },

  -- 🧠 Git integration
  { 'tpope/vim-fugitive' },           -- Git inside Neovim
  { 'tpope/vim-rhubarb' },            -- GitHub support for fugitive

  -- 🧩 Autopairs for brackets/quotes
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },

  -- 📌 Autotag for HTML, JSX, etc.
  { 'windwp/nvim-ts-autotag' },

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
