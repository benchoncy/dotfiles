-- Add or override filetype mappings

vim.filetype.add({
    extentions = {
      tf = 'terraform',
    },
    pattern = {
        -- YAML files
        ['.*%.y(a?)ml'] = function(path, bufnr)
            -- Get file content
            local content = vim.filetype.getlines(bufnr)
            if type(content) == "table" then
                content = table.concat(content, "\n")
            end
            -- Check if file is ansible, based on path or content
            if path:match('tasks/.+%.y(a?)ml') or
               path:match('handlers/.+%.y(a?)ml') or
               path:match('roles/.+%.y(a?)ml') or
               content:match('ansible%.builtin') then
                return 'yaml.ansible'
            end
            -- Default to yaml
            return 'yaml'
        end,
    },
})
