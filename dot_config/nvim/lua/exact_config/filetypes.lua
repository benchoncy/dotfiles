-- Add or override filetype mappings

local function ft_yaml(path, bufnr)
    print(path)
    -- Match ansible file paths
    if path:match('tasks/.+%.y(a?)ml') or
            path:match('handlers/.+%.y(a?)ml') or
            path:match('roles/.+%.y(a?)ml') then
        return 'yaml.ansible'
    end

    -- Match ansible content
    local content = vim.filetype.getlines(bufnr)
    if type(content) == "table" then
        content = table.concat(content, "\n")
    end
    if content:match('hosts.*gather_facts') or
            content:match('ansible%.builtin') then
        return 'yaml.ansible'
    end

    -- Default to yaml
    return 'yaml'
end

vim.filetype.add({
    extension = {
        yaml = ft_yaml,
        yml = ft_yaml,
    },
})
