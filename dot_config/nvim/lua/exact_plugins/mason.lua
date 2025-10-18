-- Mason plugin configuration
-- Purpose: Provides a package manager for linters, formatters, etc.

return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = vim.g.lsp_files
            })
        end
    }
}
