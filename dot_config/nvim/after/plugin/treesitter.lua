require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
	  "bash",
	  "go",
	  "python",
	  "hcl",
	  "terraform",
	  "make",
	  "markdown",
	  "yaml",
	  "toml",
	  "lua", 
	  "vim", 
	  "vimdoc", 
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
