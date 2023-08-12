-- Lualine plugin configuration
-- Purpose: Provides a configurable statusline UI element.

local function config()
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
            lualine_x = {'filetype'},
            lualine_y = {'lsp_progress'},
        },
    })
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
    },
    config = config,
}
