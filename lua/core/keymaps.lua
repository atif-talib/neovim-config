--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- move instantly to the normal mode
vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set('i', 'kj', '<Esc>', opts)

-- delete character but not copy to register
vim.keymap.set('n', 'x', '"_x')

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Git Fugitive and GV.vim mappings
-- vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { desc = "Git Blame (Fugitive)", unpack(opts) })
vim.keymap.set('n', '<leader>gD', ':Gvdiffsplit<CR>', { desc = "Git Diff Split", unpack(opts) })
vim.keymap.set('n', '<leader>gH', ':GV<CR>', { desc = "Git Commit History (Repo)", unpack(opts) })
vim.keymap.set('n', '<leader>gF', ':GV!<CR>', { desc = "Git File History", unpack(opts) })

-- Visual mode: Git history for selection
vim.keymap.set('v', '<leader>gh', ":'<,'>GV<CR>", { desc = "Git History for Selection", noremap = true, silent = true })

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>ba', ':%bd|e#|bd#<CR>', { desc = "Close all buffers except current" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.open_float, { desc = 'Open diagnostic [Q]uickfix' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
