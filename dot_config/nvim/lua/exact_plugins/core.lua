-- Adds core plugins
-- Purpose: Adds core plugins that are used without extra configuration

return {
    { 'numToStr/Comment.nvim', opts = {} }, -- Commenting lines/block of code
    'tpope/vim-fugitive', -- Git integration
    'tpope/vim-sleuth', -- Automatically set 'shiftwidth' and 'expandtab' based on file contents
}
