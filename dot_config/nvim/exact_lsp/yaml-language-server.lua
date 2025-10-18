---@type vim.lsp.Config
return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml" },
    settings = {
        yaml = {
            hover = true,
            validate = false,
            completion = true,
            keyOrdering = false,
            format = { enabled = false },
            redhat = {
                telemetry = { enabled = false },
            },
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = {
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
            },
        },
    },
}
