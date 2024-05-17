-- Set leader key and add or override key mappings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add or override key mappings
-- see `:help vim.keymap.set()` for more information
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = '[E]nter filesystem mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })
