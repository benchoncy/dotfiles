-- Telescope plugin configuration
-- Purpose: Provides a fuzzy finder.

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
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
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy find files' })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Fuzzy find git files' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Fuzzy find help tags' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Fuzzy find keymaps' })
        vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Fuzzy find by live grep' })
        vim.keymap.set('n', '<leader>fx', builtin.diagnostics, { desc = 'Fuzzy find diagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
        vim.keymap.set('n', '<leader>fb', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Fuzzy find in current buffer' })
        vim.keymap.set('n', '<leader>fB', builtin.buffers, { desc = 'Fuzzy find open buffers' })
        vim.keymap.set('n', '<leader>fc', builtin.quickfix, { desc = 'Fuzzy find in quickfix list' })
    end,
}
