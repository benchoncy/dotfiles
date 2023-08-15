-- Lualine plugin configuration
-- Purpose: Provides a configurable statusline UI element.

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = function()
        require('lualine').setup({
            options = {
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
