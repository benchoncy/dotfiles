-- Theme configuration
-- Purpose: Provides a UI theme.

return {
    "navarasu/onedark.nvim",
    config = function ()
        require("onedark").setup({
            style = "warmer",
        })
        vim.cmd.colorscheme "onedark"
    end
}
