-- Set vim options

-- set background to dark, because I like it that way.
vim.opt.background = "dark"

-- set cmd height
vim.opt.cmdheight = 1

-- Set line numbers and relative line numbers as default as a visual aid.
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show mode as the statusline will show it.
vim.opt.showmode = false

-- Sync the system clipboard with the vim clipboard.
vim.opt.clipboard = "unnamedplus"

-- Enable break indent, so wrapped lines are indented.
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default.
vim.opt.signcolumn = 'yes'

-- Decrease update time, makes things more snappy.
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time.
-- Displays which-key popup sooner.
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on.
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set the tab size to 4 spaces.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable auto-indenting.
vim.opt.smartindent = true

-- Disable swap and backup files.
vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- Enable search highlighting.
vim.opt.hlsearch = true

-- Enable incremental searching.
vim.opt.incsearch = true

-- Enable terminal colors
vim.opt.termguicolors = true

-- Set the color column to 80 characters as a visual aid.
vim.opt.colorcolumn = "80"
