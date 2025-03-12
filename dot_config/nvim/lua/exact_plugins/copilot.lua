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
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- See Configuration section for options
        },
            -- See Commands section for default commands if you want to lazy load on them
    }
}
