-- LSP zero and associated plugin(s) configuration
-- Purpose: Provides language server protocol integration and autocompletion.
-- TODO: Update this config compared to kickstart.nvim

return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({buffer = bufnr})

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

        -- Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        -- You need to setup `cmp` after lsp-zero
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            mapping = {
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = false}),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            }
        })
    end,
}
