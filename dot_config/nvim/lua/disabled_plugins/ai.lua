-- AI code completion and assistive tools configuration.
-- Purpose: Integrates AI-powered features into Neovim for enhanced coding assistance.

-- Note: Using external AI services may have privacy, security and cost implications.


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
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "ravitemer/mcphub.nvim"
        },
        opts = {
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                      -- MCP Tools 
                      make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
                      show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
                      add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
                      show_result_in_chat = true,      -- Show tool results directly in chat buffer
                      format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
                      -- MCP Resources
                      make_vars = true,                -- Convert MCP resources to #variables for prompts
                      -- MCP Prompts 
                      make_slash_commands = true,      -- Add MCP prompts as /slash commands
                    }
                }
            }
        },
        config = function(_, opts)
            require("codecompanion").setup(opts)

            vim.keymap.set({ "n", "v" }, "<leader>aa", ":CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "Show available AI actions" })
            vim.keymap.set({ "n", "v" }, "<leader>ac", ":CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "Toggle AI chat window" })

            -- Expand 'cc' into 'CodeCompanion' in the command line
            vim.cmd([[cab cc CodeCompanion]])
        end,
    },
}
