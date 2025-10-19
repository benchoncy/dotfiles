---@type vim.lsp.Config
return {
    cmd = { "tofu-ls", "serve" },
    filetypes = { "terraform", "terraform-vars", "tf", "tfvars", "tofu" },
    root_markers = { ".terraform", ".git" },
}
