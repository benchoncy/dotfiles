-- Copilot plugin configuration.
-- Purpose: Provides AI-assisted code completion.

return {
    {
        'zbirenbaum/copilot-cmp',
        config = function ()
            require('copilot_cmp').setup()
        end,
        dependencies = {
            'zbirenbaum/copilot.lua'
        }
    },
    {
        'zbirenbaum/copilot.lua',
        config = function ()
            require("copilot").setup({
                filetypes = {
                    ["*"] = true, -- Enable Copilot for all filetypes
                },
                -- Disable the default completion handler so that cmp can handle completions
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    }
}
