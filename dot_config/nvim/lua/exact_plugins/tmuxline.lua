-- Plugin to generate a tmuxline from Neovim's theme
-- Purpose: Syncs tmux theme with Neovim's theme

return {
    "edkolev/tmuxline.vim",
    config = function()
        vim.g.tmuxline_powerline_separators = 0
        vim.g.tmuxline_status_justify = "left"
        vim.g.tmuxline_preset = {
            a = "#S",
            win = "#I:#W",
            cwin = "#I:#W#F",
            x = "#W",
            y = "%Y-%m-%d",
            z = "%a %H:%M",
        }
        vim.g.tmuxline_separators = {
            left = "",
            right = "",
            left_alt = "|",
            right_alt = "|",
            space = " ",
        }

        -- Create a command to generate the tmux theme
        vim.api.nvim_create_user_command('GenTheme', function ()
            local snapshot_file = "~/.local/share/chezmoi/dot_config/tmux/theme.conf"
            vim.print("Generating tmux theme...")
            vim.cmd("Tmuxline vim_statusline_3")
            vim.print("Saving theme to " .. snapshot_file)
            vim.cmd("TmuxlineSnapshot! " .. snapshot_file)
        end,{})
    end
}
