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
        vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "[r]efactor func [e]xtract" })
        vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "[r]efactor func to [f]ile" })
        vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func", { desc = "[r]efactor func to [I]nline" })
        -- Var keymaps
        vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "[r]efactor [v]ar extract" })
        vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "[r]efactor var to [i]nline" })
        -- Block keymaps
        vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "[r]efactor [b]lock extract" })
        vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "[r]efactor [b]lock to [f]ile" })
        -- Selection keymaps
        vim.keymap.set(
            {"n", "x"},
            "<leader>rr",
            function() require('telescope').extensions.refactoring.refactors() end,
            { desc = "[r]efactoring [r]efactors" }
        )
    end,
}
