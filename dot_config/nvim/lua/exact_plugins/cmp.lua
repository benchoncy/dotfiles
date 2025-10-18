-- Neovim cmp a completion engine plugin
-- Purpose: Provides autocompletion.

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-emoji',
        'zbirenbaum/copilot-cmp',
        'olimorris/codecompanion.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                {name = "copilot", group_index = 2},
                {name = 'nvim_lsp', group_index = 2},
                {name = 'buffer', keyword_length = 3},
                {name = 'emoji'},
                {name = 'path', group_index = 4},
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm completion, select = true will cause <CR> to select the first completion item
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {},
        })
    end,
}
