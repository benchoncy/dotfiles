local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        -- Lua
        "lua_ls",
        -- Bash
        "bashls",
        -- Docker
        "dockerls",
        -- Go
        "gopls",
        -- Data files
        "html",
        "jsonls",
        "taplo",
        "yamlls",
        -- Latex
        "ltex",
        -- Markdown
        "marksman",
        -- Python
        "pyright",
        "pylsp",
        -- Terraform
        "terraformls",
        -- Ansible
        "ansiblels",
        -- Kubernetes
        "helm_ls",
    },
})

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
