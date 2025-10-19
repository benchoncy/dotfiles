---@type vim.lsp.Config
return {
    cmd = { "tflint", "--langserver" },
    filetypes = { "terraform", "terraform-vars", "tf", "tfvars", "tofu" },
    root_markers = { ".terraform", ".git" },
}
