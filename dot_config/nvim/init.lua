-- Neovim entrypoint, loads plugins and config.

-- For best performance, ensure the following are installed:
-- System packages
-- - fzf
-- - ripgrep
-- - fd
--
-- Python packages:
-- - neovim

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Fetch list of configured LSPs by reading the lsp directory
local lsp_files = {}

for _, file in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local name = vim.fn.fnamemodify(file, ":t:r") -- `:t` gets filename, `:r` removes extension
  table.insert(lsp_files, name)
end
-- Save list of LSP files to global variable for later use
vim.g.lsp_files = lsp_files

-- Setup lazy plugins
require("lazy").setup("lazy_plugins")
