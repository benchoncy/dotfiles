-- Refactoring plugin configuration
-- Purpose: Provides useful refactoring tools based on Martin Fowler's book "Refactoring".

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("refactoring").setup()
        require("telescope").load_extension("refactoring")
        -- Func keymaps
        vim.keymap.set("x", "<leader>rf", ":Refactor extract ", { desc = "Extract func" })
        vim.keymap.set("x", "<leader>rF", ":Refactor extract_to_file ", { desc = "Extract func to file" })
        vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func", { desc = "Inline func" })
        -- Var keymaps
        vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract var" })
        vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline var" })
        -- Block keymaps
        vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract block" })
        vim.keymap.set("n", "<leader>rB", ":Refactor extract_block_to_file", { desc = "Extract block to file" })
        -- Selection keymaps
        vim.keymap.set(
            {"n", "x"},
            "<leader>rr",
            function() require('telescope').extensions.refactoring.refactors() end,
            { desc = "Show refactoring options" }
        )
    end,
}
