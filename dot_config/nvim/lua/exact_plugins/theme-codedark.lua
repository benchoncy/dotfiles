-- Code Dark theme configuration
-- Purpose: Provides a dark UI theme.

local config = function()
    vim.cmd.colorscheme("codedark")
end

return {
    'tomasiser/vim-code-dark',
    config = config,
}
