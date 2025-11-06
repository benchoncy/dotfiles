-- AI code completion and assistive tools configuration.
-- Purpose: Integrates AI-powered features into Neovim for enhanced coding assistance.

-- Note: Using external AI services may have privacy, security and cost implications.


return {
    { -- Copilot completion source for nvim-cmp
        'zbirenbaum/copilot-cmp',
        config = function()
            require('copilot_cmp').setup()
        end,
        dependencies = {
            'zbirenbaum/copilot.lua'
        }
    },
    { -- GitHub Copilot integration
        'zbirenbaum/copilot.lua',
        config = function()
            require("copilot").setup({
                filetypes = {
                    ["*"] = true, -- Enable Copilot for all filetypes
                },
                -- Disable the default completion handler so that cmp can handle completions
                suggestion = { enabled = false },
                panel = { enabled = false },
                server_opts_overrides = {
                    trace = "verbose",
                    settings = {
                        advanced = {
                            listCount = 5,          -- completions for panel
                            inlineSuggestCount = 3, -- completions for getCompletions
                        }
                    },
                }
            })
        end
    },
    { -- Supermaven integration
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                disable_inline_completion = true, -- disables inline completion for use with cmp
                disable_keymaps = true,           -- disables keymaps for use with cmp
            })
        end,
    },
}
