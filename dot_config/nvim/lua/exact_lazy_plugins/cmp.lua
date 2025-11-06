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
        'onsails/lspkind-nvim',
        'zbirenbaum/copilot-cmp',
        "supermaven-inc/supermaven-nvim"
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local lspkind = require('lspkind')

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "supermaven", priority = 150,  max_item_count = 3 },
                { name = "copilot",    priority = 150,  max_item_count = 3 },
                { name = 'nvim_lsp',   priority = 100 },
                { name = 'buffer',     priority = 10 },
                { name = 'emoji',      group_index = 5, keyword_length = 2 },
                { name = 'path',       group_index = 6 },
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
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text', -- show only symbol annotations
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50,            -- leading text (labelDetails)
                        abbr = 50,            -- actual suggestion item
                    },
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        -- ...
                        return vim_item
                    end,

                    -- Add custom symbols
                    symbol_map = {
                        Supermaven = "",
                        Copilot = "",
                    },

                })
            }
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
