-- Theme configuration
-- Purpose: Provides a UI theme.

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        auto_integrations = true,
    },
    config = function()
        vim.cmd.colorscheme "catppuccin-macchiato"
    end
}
