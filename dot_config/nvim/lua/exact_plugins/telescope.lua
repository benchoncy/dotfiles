-- Telescope plugin configuration
-- Purpose: Provides a fuzzy finder.

return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    tag = '0.1.8',
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
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find git files' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
        vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Find by live grep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find diagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent files' })
        vim.keymap.set('n', '<leader>fc', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Find in current buffer' })
    end,
}
