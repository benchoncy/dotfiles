-- Oil plugin configuration
-- Purpose: Provides a directory buffer editor.

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
        })
        vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = 'Enter filesystem mode' })
    end,
}
