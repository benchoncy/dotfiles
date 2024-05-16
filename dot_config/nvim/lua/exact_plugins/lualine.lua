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
                section_separators = { left = '', right = ''},
            },
            -- sections to be shown on the statusline
            -- in order, left to right, a, b, c, x, y, z
            -- abc are left sections, xyz are right sections
            -- see `:help lualine` for more information
            sections = {
                lualine_x = {'lsp_progress'},
                lualine_y = {'filetype'},
                lualine_z = {'location'},
            },
        })
    end,
}
