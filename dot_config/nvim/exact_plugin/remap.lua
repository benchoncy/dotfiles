-- Set leader key and add or override key mappings

-- Add or override key mappings
-- see `:help vim.keymap.set()` for more information
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = 'Enter filesystem mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- LSP keymaps
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
vim.keymap.set({ 'n', 'v' }, '<leader>F', vim.lsp.buf.format, { desc = 'Format' })

-- Diagnostic keymaps
vim.keymap.set('n', '[x', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic message' })
vim.keymap.set('n', ']x', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>xs', function()
  vim.diagnostic.open_float(nil, { scope = 'line', border = 'rounded' })
end, { desc = 'Show diagnostic error messages' })
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Buffer keymaps
vim.keymap.set('n', '[b', ':bprev<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { desc = 'Next buffer' })

-- Quickfix list keymaps
vim.keymap.set('n', '[c', ':cprev<CR>', { desc = 'Prev quickfix item' })
vim.keymap.set('n', ']c', ':cnext<CR>', { desc = 'Next quickfix item' })

-- Add insert and command mode navigation
vim.keymap.set({ 'i', 'c' }, '<C-h>', '<Left>', { desc = 'Move cursor left' })
vim.keymap.set({ 'i', 'c' }, '<C-j>', '<Down>', { desc = 'Move cursor down' })
vim.keymap.set({ 'i', 'c' }, '<C-k>', '<Up>', { desc = 'Move cursor up' })
vim.keymap.set({ 'i', 'c' }, '<C-l>', '<Right>', { desc = 'Move cursor right' })

-- Disable arrow keys
vim.keymap.set({ 'n', 'i', 'v' }, '<Up>', '<Nop>', { desc = 'Disable Up arrow key' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Down>', '<Nop>', { desc = 'Disable Down arrow key' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Left>', '<Nop>', { desc = 'Disable Left arrow key' })
vim.keymap.set({ 'n', 'i', 'v' }, '<Right>', '<Nop>', { desc = 'Disable Right arrow key' })
