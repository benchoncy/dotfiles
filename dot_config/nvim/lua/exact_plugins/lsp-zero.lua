-- LSP zero and associated plugin(s) configuration
-- Purpose: Provides language server protocol integration and autocompletion.

return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'zbirenbaum/copilot-cmp',
        -- NeoVim Development
        { 'folke/neodev.nvim', opts = {} },

    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)

            local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            -- Set keymaps for LSP
            map('gd', require('telescope.builtin').lsp_definitions, 'Go to definition')
            map('gD', vim.lsp.buf.declaration, 'Go to declaration')
            map('gr', require('telescope.builtin').lsp_references, 'Go to references')
            map('gI', require('telescope.builtin').lsp_implementations, 'Go to implementations')
            map('gt', require('telescope.builtin').lsp_type_definitions, 'Go to type definitions')
            map('gsd', require('telescope.builtin').lsp_document_symbols, 'Go to document symbols')
            map('gsw', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Go to workspace symbols')
            map('<leader>rn', vim.lsp.buf.rename, 'Rename')
            map('<leader>c', vim.lsp.buf.code_action, 'Code action')
            map('K', vim.lsp.buf.hover, 'Hover documentation')
            map('<leader>l', function() vim.lsp.buf.formatting({async = true, timeout = 10000}) end, 'Langauge format')
        end)

        -- `format_on_save` should run only once, before the language servers are active.
        lsp_zero.format_on_save({
          format_opts = {
            async = false,
            timeout_ms = 10000,
          },
          -- The servers that should be enabled for formatting on save, formatted as {[server_name] = {filetypes}}
          servers = {
            ['gopls'] = {'go'},
            ['ruff'] = {'python'},
            ['bashls'] = {'bash'},
            ['terraformls'] = {'terraform'},
          }
        })

        -- Configure lua language server for neovim
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls', -- Lua language server
                'bashls', -- Bash language server
                'ruff', -- Python language server and formatter
                -- 'pylsp', -- Python language server
                'gopls', -- Go language server
                'terraformls', -- Terraform language server
            },
            handlers = {
                lsp_zero.default_setup,
                -- Configure language servers here
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
            }
        })
        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            sources = {
                -- Copilot Source
                {name = "copilot", group_index = 2},
                {name = 'nvim_lsp', group_index = 2},
                {name = 'path', group_index = 2},
                {name = 'nvim_lua'},
                {name = 'luasnip'},
                {name = 'buffer', keyword_length = 3},
            },
            formatting = lsp_zero.cmp_format({details = false}),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm completion, select = true will cause <CR> to select the first completion item
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })
    end,
}
