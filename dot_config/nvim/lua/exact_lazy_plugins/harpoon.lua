-- Adds harpoon plugin
-- Purpose: additional navigation and file marking capabilities

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        vim.keymap.set("n", "<leader>ho", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
        vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "Remove file from harpoon" })
        vim.keymap.set("n", "]h", function() harpoon:list():next() end, { desc = "Next harpoon file" })
        vim.keymap.set("n", "[h", function() harpoon:list():prev() end, { desc = "Prev harpoon file" })
        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end , { desc = "Go to harpoon file 1" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end , { desc = "Go to harpoon file 2" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end , { desc = "Go to harpoon file 3" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end , { desc = "Go to harpoon file 4" })
    end,
}
