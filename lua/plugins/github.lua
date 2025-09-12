return {
  -- Gitsigns - Minimalistic with simple symbols and essential toggles
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '-' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '?' },
      },
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
      },
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        local map = function(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']h', gs.next_hunk, { desc = 'Next hunk' })
        map('n', '[h', gs.prev_hunk, { desc = 'Previous hunk' })

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })

        -- Visual mode
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Stage hunk' })
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Reset hunk' })

        -- Toggles
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle git blame' })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted' })
        map('n', '<leader>gts', gs.toggle_signs, { desc = 'Toggle git signs' })

        -- Blame
        map('n', '<leader>gb', gs.blame_line, { desc = 'Blame line' })
        map('n', '<leader>gB', function() gs.blame_line({ full = true }) end, { desc = 'Blame line (full)' })
      end,
    },
  },

  -- Fugitive - Essential git commands with browser support
  {
    'tpope/vim-fugitive',
    dependencies = { 'tpope/vim-rhubarb' }, -- GitHub browser support
    cmd = { 'Git', 'G', 'GBrowse' },
    keys = {
      -- Core commands
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
      { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'Git diff' },
      { '<leader>gl', '<cmd>Git log --oneline<cr>', desc = 'Git log' },
      
      -- History commands
      { '<leader>gh', '<cmd>Git log --oneline %<cr>', desc = 'Git file history' },
      { '<leader>gH', function()
          local line = vim.fn.line('.')
          vim.cmd('Git log -L' .. line .. ',' .. line .. ':%')
        end, desc = 'Git line history' },
      { '<leader>gH', function()
          local start_line = vim.fn.line('v')
          local end_line = vim.fn.line('.')
          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
          vim.cmd('Git log -L' .. start_line .. ',' .. end_line .. ':%')
        end, desc = 'Git selection history', mode = 'v' },
      
      -- Browser support
      { '<leader>go', '<cmd>GBrowse<cr>', desc = 'Open in browser', mode = { 'n', 'v' } },
      { '<leader>gy', '<cmd>GBrowse!<cr>', desc = 'Copy git URL', mode = { 'n', 'v' } },
    },
    config = function()
      -- Auto-close fugitive buffers
      vim.api.nvim_create_autocmd('BufReadPost', {
        group = vim.api.nvim_create_augroup('FugitiveSettings', { clear = true }),
        pattern = 'fugitive://*',
        callback = function()
          vim.opt_local.bufhidden = 'delete'
          vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = true })
        end,
      })

      -- Custom command for interactive line history
      vim.api.nvim_create_user_command('GitLineHistory', function(opts)
        local line = opts.line1
        local end_line = opts.line2
        if line == end_line then
          vim.cmd('Git log -L' .. line .. ',' .. line .. ':% --follow')
        else
          vim.cmd('Git log -L' .. line .. ',' .. end_line .. ':% --follow')
        end
      end, { range = true })

      -- Custom command for detailed line history with patches
      vim.api.nvim_create_user_command('GitLineHistoryDetailed', function(opts)
        local line = opts.line1
        local end_line = opts.line2
        if line == end_line then
          vim.cmd('Git log -L' .. line .. ',' .. line .. ':% --follow -p')
        else
          vim.cmd('Git log -L' .. line .. ',' .. end_line .. ':% --follow -p')
        end
      end, { range = true })
    end,
  },

  -- LazyGit integration
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit current file' },
    },
    config = function()
      -- Configure LazyGit floating window
      vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
      vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize border
      vim.g.lazygit_use_neovim_remote = 1 -- Use neovim remote for opening files
    end,
  },
}
