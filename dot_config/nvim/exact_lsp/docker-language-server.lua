---@type vim.lsp.Config
return {
    cmd = { "docker-language-server", "start", "--stdio" },
    filetypes = { "dockerfile" },
    settings = {
        telemetry = "off"
    },
}
