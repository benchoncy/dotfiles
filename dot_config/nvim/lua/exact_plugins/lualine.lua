-- Lualine plugin configuration
-- Purpose: Provides a configurable statusline UI element.

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = function()
        local custom_kanagawa = require('lualine.themes.kanagawa')
        custom_kanagawa.normal.b.bg = '#181616'

        require('lualine').setup({
            options = {
                theme = custom_kanagawa,
                section_separators = {'|', '|'},
                component_separators = {'|', '|'},
            },
            -- Sections to be shown on the statusline
            -- In order, left to right, A, B, C, X, Y, Z
            -- ABC are left sections, XYZ are right sections
            -- See `:help lualine` for more information
            sections = {
                lualine_x = {'lsp_progress', 'filetype'},
                lualine_y = {},
            },
        })
    end,
}
