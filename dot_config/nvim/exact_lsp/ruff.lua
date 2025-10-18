--- @type vim.lsp.Config
return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python', 'py' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {},
}
