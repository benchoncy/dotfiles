-- Set leader key and add or override key mappings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add or override key mappings
-- see `:help vim.keymap.set()` for more information
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = 'Enter filesystem mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>xs', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Buffer keymaps
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- Disable arrow keys in all modes
vim.keymap.set({'n', 'i', 'v'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'v'}, '<Down>', '<Noop>')
vim.keymap.set({'n', 'i', 'v'}, '<Left>', '<Noop>')
vim.keymap.set({'n', 'i', 'v'}, '<Right>', '<Noop>')
