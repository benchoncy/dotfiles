local config = function()
    require('lualine').setup({
        options = {
            section_separators = {'|', '|'},
            component_separators = {'|', '|'},
        },
        sections = {
            lualine_x = {'filetype'},
            lualine_y = {},
        },
    })
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = config,
}
