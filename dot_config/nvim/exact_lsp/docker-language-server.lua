---@type vim.lsp.Config
return {
    cmd = { "docker-language-server", "start" },
    filetypes = { "dockerfile" },
    settings = {
        telemetry = "off"
    },
}
