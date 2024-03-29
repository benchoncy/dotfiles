-- Adds which-key plugin
-- Purpose: Provides a popup with a list of keybindings for the current mode.

return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        require('which-key').setup()
    end
}
