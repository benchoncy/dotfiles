call plug#begin()

" Colour scheme
Plug 'tomasiser/vim-code-dark'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

" Language Colours
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim',          " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

" AI Assistance
Plug 'github/copilot.vim'

" Git
Plug 'tpope/vim-fugitive'

" Icons
Plug 'nvim-tree/nvim-web-devicons'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

call plug#end()
