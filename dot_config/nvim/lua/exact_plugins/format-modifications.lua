-- Lsp format modifications
-- Purpose: Provides a tool to apply formatting to modifications only

return {
    {
        "joechrisellis/lsp-format-modifications.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            -- Create command to set autoformatting to modified sections only
            vim.api.nvim_create_user_command("FormatModeModified", function()
                vim.g.autoformat_func = function(client, bufnr)
                    local lsp_format_modifications = require("lsp-format-modifications")
                    lsp_format_modifications.format_modifications(client, bufnr)
                end
            end, {
                desc = "Set autoformatting mode to modified"
            })
        end
    }
}
