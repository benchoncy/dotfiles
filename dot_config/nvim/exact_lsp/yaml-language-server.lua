---@type vim.lsp.Config
return {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    settings = {
        yaml = {
            hover = true,
            validate = true,
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
                ["https://www.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["https://www.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] =
                "*{template,.sam}.{yml,yaml}",
                ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] =
                "*{cloudformation,.cf}.{yml,yaml}"
            },
            customTags = {
                "!fn",
                "!And",
                "!If",
                "!Not",
                "!Equals",
                "!Or",
                "!FindInMap sequence",
                "!Base64",
                "!Cidr",
                "!Ref",
                "!Ref Scalar",
                "!Sub",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!Select",
                "!Split",
                "!Join sequence"
            },
        },
    },
}
