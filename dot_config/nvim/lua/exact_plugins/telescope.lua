-- Telescope plugin configuration
-- Purpose: Provides a fuzzy finder.

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [f]iles' })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [g]it files' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [b]uffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [h]elp tags' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [k]eymaps' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [g]rep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [d]iagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [r]ecent files' })
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind [s]ymbols' })
        vim.keymap.set('n', '<leader>ft', builtin.lsp_workspace_symbols, { desc = '[F]ind [t]ags' })
        vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_diagnostics, { desc = '[F]ind [w]arnings' })
        vim.keymap.set('n', '<leader>fl', builtin.lsp_references, { desc = '[F]ind [l]ocations' })
        vim.keymap.set('n', '<leader>fc', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[F]ind in [c]urrent buffer' })
    end,
}
