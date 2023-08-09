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
            -- Check if file is ansible
            if path:match('[tasks|roles|handlers].*$') or
               content:match('[hosts|gather_facts|vars_files]:') then
                return 'yaml.ansible'
            end
            -- Default to yaml
            return 'yaml'
        end,
    },
})
