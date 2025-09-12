return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>bf',
      function()
        require('conform').format { async = true, formatters = { 'black' } }
      end,
      desc = '[B]uffer [F]ormat',
    },
    {
      '<leader>bi',
      function()
        require('conform').format {
          async = true,
          formatters = { 'isort' },
        }
      end,
      desc = '[B]uffer organize [I]mports',
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
    },
    formatters = {
      black = {
        prepend_args = { '--line-length', '120' },
      },
    },
  },
}
