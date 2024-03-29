-- Add todo-comments plugin
-- Purpose: Adds the ability to highlight TODO, FIXME, etc. comments.

return {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    opts = { signs = false },
}
