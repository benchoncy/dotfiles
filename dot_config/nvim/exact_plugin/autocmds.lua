-- Setup auto commands

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Display LSP diagnostics in a floating window when the cursor is held
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  desc = 'Display LSP diagnostics in a floating window when the cursor is held',
  group = vim.api.nvim_create_augroup('lsp-diagnostics-hover', { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor', border = 'rounded' })
  end,
})
