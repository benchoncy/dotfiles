-- Neovim cmp a completion engine plugin
-- Purpose: Provides autocompletion.

return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-cmdline',
        'zbirenbaum/copilot-cmp',
        'olimorris/codecompanion.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "copilot",  priority = 100,  max_item_count = 3 },
                { name = 'nvim_lsp', priority = 100 },
                { name = 'buffer',   priority = 10 },
                { name = 'emoji',    group_index = 5, keyword_length = 2 },
                { name = 'path',     group_index = 6 },
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

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
}
