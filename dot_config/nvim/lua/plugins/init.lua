-- Return list of plugins
return {
    -- Colour scheme
    'tomasiser/vim-code-dark',
    -- Fuzzy finder
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope.nvim', tag = '0.1.2'},
    -- Language Colours
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
    -- LSP Support
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    {'VonHeikemen/lsp-zero.nvim', branch = 'v2.x'},
    -- AI Assistance
    'github/copilot.vim',
    -- Git
    'tpope/vim-fugitive',
    -- Icons
    'nvim-tree/nvim-web-devicons',
    -- Status Line
    'nvim-lualine/lualine.nvim',
}
