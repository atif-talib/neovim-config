return {
  'gbprod/yanky.nvim',
  dependencies = { 'kkharji/sqlite.lua' }, -- optional: for persistent history
  opts = {
    ring = {
      history_length = 100,
      storage = 'sqlite', -- persists across sessions (if sqlite.lua is installed)
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 200,
    },
  },
  keys = {
    -- Cycle through yank history
    { 'p', "<Plug>(YankyPutAfter)", mode = { 'n', 'x' }, desc = 'Put after (Yanky)' },
    { 'P', "<Plug>(YankyPutBefore)", mode = { 'n', 'x' }, desc = 'Put before (Yanky)' },
    { 'gp', "<Plug>(YankyGPutAfter)", mode = { 'n', 'x' }, desc = 'Put after (cursor stays)' },
    { 'gP', "<Plug>(YankyGPutBefore)", mode = { 'n', 'x' }, desc = 'Put before (cursor stays)' },
    -- Cycle
    { '<c-n>', "<Plug>(YankyCycleForward)", desc = 'Next Yank' },
    { '<c-p>', "<Plug>(YankyCycleBackward)", desc = 'Prev Yank' },
    -- Telescope integration (optional)
    { '<leader>sy', function() require('telescope').extensions.yank_history.yank_history() end, desc = '[S]earch [Y]ank History' },
  },
  config = function(_, opts)
    require('yanky').setup(opts)
    -- optional: telescope integration
    pcall(require('telescope').load_extension, 'yank_history')
  end,
}
