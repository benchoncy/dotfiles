-- Treesitter plugin configuration
-- Purpose: Provides syntax highlighting.

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                'bash',
                'go',
                'lua',
                'luadoc',
                'python',
                'rust',
                'toml',
                'yaml',
                'json',
                'markdown',
                'vim',
                'vimdoc',
            },
            auto_install = true,

            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                -- If you are experiencing weird indenting issues, add the language to
                -- the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = {},
                indent = {
                    enable = true,
                    disable = {},
                },
            },
        }
    end,
}
