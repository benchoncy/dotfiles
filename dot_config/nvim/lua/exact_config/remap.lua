-- Set leader key and add or override key mappings

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add or override key mappings
-- see `:help vim.keymap.set()` for more information
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = 'Enter [E]x mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show [d]iagnostic Error messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
