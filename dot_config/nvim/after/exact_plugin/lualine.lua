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
