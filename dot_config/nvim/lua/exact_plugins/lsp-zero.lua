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
        -- NeoVim Development
        { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)

            local map = function(keys, func, desc)
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
            end

            -- Set keymaps for LSP
            map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementations')
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('<leader>lf', function() vim.lsp.buf.formatting({async = true, timeout = 10000}) end, '[L]anguage [F]ormat')

            -- Enable wrap for markdown, text, and tex files
            if vim.bo.filetype == 'markdown'
                or vim.bo.filetype == 'text'
                or vim.bo.filetype == 'tex'
                then
                vim.wo.wrap = true
                vim.wo.linebreak = true
            else
                vim.wo.wrap = false
                vim.wo.linebreak = false
            end
        end)

        -- `format_on_save` should run only once, before the language servers are active.
        lsp_zero.format_on_save({
          format_opts = {
            async = false,
            timeout_ms = 10000,
          },
          servers = {
            ['rust_analyzer'] = {'rust'},
            ['gopls'] = {'go'},
            ['ruff_lsp'] = {'python'},
            ['terraformls'] = {'terraform'},
          }
        })

        -- Configure lua language server for neovim
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls', -- Lua language server
                'bashls', -- Bash language server
                'ruff_lsp', -- Python language server
                'gopls', -- Go language server
                'terraformls', -- Terraform language server
                'rust_analyzer', -- Rust language server
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
                {name = 'nvim_lsp'},
                {name = 'nvim_lua'},
                {name = 'luasnip'},
                {name = 'path'},
                {name = 'buffer', keyword_length = 3},
            },
            formatting = lsp_zero.cmp_format({details = false}),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
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
