-- Neovim entrypoint, loads plugins and config.

-- For best performance, ensure the following are installed:
-- System packages
-- - fzf
-- - ripgrep
-- - fd
--
-- Python packages:
-- - neovim

-- Load regular config
require("config")

-- Bootstrap lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy plugins
require("lazy").setup("plugins")
