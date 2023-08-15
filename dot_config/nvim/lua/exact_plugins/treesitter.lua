-- Treesitter plugin configuration
-- Purpose: Provides syntax highlighting.

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
