-- Lualine plugin configuration
-- Purpose: Provides a configurable statusline UI element.

return {
    {
        'linrongbin16/lsp-progress.nvim',
        config = function()
          require('lsp-progress').setup()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'catppuccin/nvim',
            'linrongbin16/lsp-progress.nvim',
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "catppuccin-macchiato",
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                -- sections to be shown on the statusline
                -- in order, left to right, a, b, c, x, y, z
                -- abc are left sections, xyz are right sections
                -- see `:help lualine` for more information
                sections = {
                    lualine_c = {
                      function()
                        -- invoke `progress` here.
                        return require('lsp-progress').progress()
                      end,
                    },
                    lualine_x = {},
                    lualine_y = {'filetype'},
                    lualine_z = {'location'},
                },
            })

            -- listen lsp-progress event and refresh lualine
            vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
            vim.api.nvim_create_autocmd("User", {
              group = "lualine_augroup",
              pattern = "LspProgressStatusUpdated",
              callback = require("lualine").refresh,
            })
        end,
    }
}
