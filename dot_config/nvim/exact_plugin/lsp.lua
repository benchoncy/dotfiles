-- LSP configuration
-- Purpose: Setup language servers for languages in use.

-- Enable LSPs for all configured files
vim.lsp.enable(vim.g.lsp_files)

-- Create commands for enabling/disabling autoformatting on save
-- Used to toggle autoformatting on/off when needed
vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Enable autoformat-on-save",
})

-- Create command to set autoformatting to full buffer
-- Used to set formatting mode to full buffer formatting
vim.api.nvim_create_user_command("FormatModeFull", function()
    --- @diagnostic disable-next-line: duplicate-set-field
    vim.g.autoformat_func = function(_, bufnr)
        vim.lsp.buf.format({
            bufnr = bufnr,
            async = false,
        })
    end
end, {
    desc = "Set autoformatting mode to full"
})
vim.cmd.FormatModeFull() -- Default to full formatting

-- Create autocommand to format on save
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP format on save",
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Enable only if the LSP client supports formatting
        if not client or not client:supports_method("textDocument/formatting") then
            return
        end

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if vim.g.disable_autoformat or vim.b[args.buf].disable_autoformat then
                    return
                end
                vim.g.autoformat_func(client, args.buf)
            end
        })
    end
})
