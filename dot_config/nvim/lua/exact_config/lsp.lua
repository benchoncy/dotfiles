-- LSP configuration
-- Purpose: Setup language servers for languages in use.

-- Fetch list of configured LSPs by reading the lsp directory
local lsp_files = {}

for _, file in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
    local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
    table.insert(lsp_files, name)
end

vim.g.lsp_files = lsp_files

vim.lsp.enable(vim.g.lsp_files)
