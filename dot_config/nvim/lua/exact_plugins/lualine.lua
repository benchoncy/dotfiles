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
                component_separators = { left = '∕', right = '∕'},
                section_separators = { left = '', right = ''},
            },
            -- Sections to be shown on the statusline
            -- In order, left to right, A, B, C, X, Y, Z
            -- ABC are left sections, XYZ are right sections
            -- See `:help lualine` for more information
            sections = {
                lualine_x = {'lsp_progress'},
                lualine_y = {'filetype'},
                lualine_z = {'location'},
            },
        })
    end,
}
