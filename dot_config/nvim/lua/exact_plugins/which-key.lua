-- Adds which-key plugin
-- Purpose: Provides a popup with a list of keybindings for the current mode.

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = "modern",
    spec = {
      { "g", group = "Go to" },
      { "]", group = "Next" },
      { "v]", group = "Next" },
      { "[", group = "Prev" },
      { "v[", group = "Prev" },
      { "<leader>", group = "Leader Key" },
      { "v<leader>", group = "Leader Key" },
      { "<leader>f", group = "Find" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>r", group = "Refactoring" },
      { "v<leader>r", group = "Refactoring" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>a", group = "AI" },
      { "v<leader>a", group = "AI" },
    },
  },
  keys = {
    {
      "?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
