-- line numbers
vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- set relative numbered lines

-- tabs and indentation
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert n spaces for a tab
vim.o.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
vim.o.showtabline = 2 -- always show tabs
vim.o.expandtab = true -- convert tabs to spaces
vim.o.autoindent = true -- copy indent from current line when starting new one

-- how tab/trail/space shows up
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- line wrapping
vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
vim.o.wrap = false -- display lines as one long line
vim.o.linebreak = true -- companion to wrap don't split words
vim.o.breakindent = true -- Enable break indent

-- search settings
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- smart case
vim.o.hlsearch = false -- Set highlight on search

-- Show which line your cursor is on
vim.o.cursorline = true

-- appearance
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.g.have_nerd_font = true

-- backspace
vim.o.backspace = 'indent,eol,start' -- allow backspace on

-- clipboard
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.

-- split windows
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window

vim.o.mouse = 'a' -- Enable mouse mode, can be used for resizing splits
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.o.backup = false -- creates a backup file
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.swapfile = false -- creates a swapfile
vim.o.smartindent = true -- make indenting smarter again
vim.o.pumheight = 10 -- pop up menu height
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.fileencoding = 'utf-8' -- the encoding written to a file
vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use
