return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = { filetype = { 'neo-tree', 'neo-tree-popup', 'notify' }, buftype = { 'terminal', 'quickfix' } },
          },
        }
      end,
      keys = {
        { '<leader>e', ':Neotree toggle position=left<CR>', silent = true, desc = 'File Explorer' },
      },
    },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = false,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
          expander_collapsed = '',
          expander_expanded = '',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',
          folder_empty_open = '',  -- visually distinct open empty folder
          default = '󰈙',
        },
        modified = {
          symbol = '[+]',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        git_status = {
          symbols = {
            -- Change type
            added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = '✖', -- this can only be used in the git_status source
            renamed = '', -- this can only be used in the git_status source
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
      },
      window = {
        position = 'left',
        width = 30,
        mapping_options = { noremap = true, nowait = true },
        mappings = {
          ['<cr>'] = 'open',
          ['<bs>'] = 'navigate_up',
          ['o'] = 'open',
          ['s'] = 'open_vsplit',
          ['S'] = 'open_split',
          ['t'] = 'open_tabnew',
          ['a'] = { 'add', config = { show_path = 'none' } },
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['.'] = 'toggle_hidden',
          ['/'] = 'fuzzy_finder',
          ['<Space>'] = 'none',
          ['D'] = 'fuzzy_finder_directory',
          ['#'] = 'fuzzy_sorter',
        },
        fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
          ['<down>'] = 'move_cursor_down',
          ['<C-n>'] = 'move_cursor_down',
          ['<up>'] = 'move_cursor_up',
          ['<C-p>'] = 'move_cursor_up',
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = { '__pycache__', '.python-version', '.venv', '.git' },
        },
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = false,
      },
    }

    -- Quick mapping to reveal current file
    vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
  end,
}
