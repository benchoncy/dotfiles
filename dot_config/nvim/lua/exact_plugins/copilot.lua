-- Copilot plugin configuration.
-- Purpose: Provides AI-assisted code completion.

return {
    'github/copilot.vim',
    config = function ()
        vim.g.copilot_filetypes = {
            ['*'] = true,
        }
    end
}
