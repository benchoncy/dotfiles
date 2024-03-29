-- Undotree plugin configuration.
-- Purpose: Provides a visual representation of the undo tree.

return {
    'mbbill/undotree',
    config = function ()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [u]ndo tree" })
    end
}
