return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-v>"] = actions.select_vertical,
            ["<C-h>"] = actions.select_horizontal,
            ["<C-t>"] = actions.select_tab,
          },
          n = {
            ["q"] = actions.close,
          }
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob", "!poetry.lock"
          }
        },
        buffers = {
          initial_mode = "normal",
        },
      },
    })

    pcall(telescope.load_extension, 'fzf')

    -- Essential keymaps
    vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end, { desc = "Telescope: Find Files" })
    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end, { desc = "Telescope: Live Grep" })
    vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end, { desc = "Telescope: List Buffers" })
    vim.keymap.set('n', '<leader>fr', function() builtin.oldfiles() end, { desc = "Telescope: Recent Files" })
    vim.keymap.set('n', '<leader>fk', function() builtin.keymaps() end, { desc = "Telescope: Show Keymaps" })
 
  end,
}
