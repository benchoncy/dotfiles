-- Add or override filetype mappings

local function is_helm_file(path, _)
    local check = vim.fs.find("Chart.yaml", { path = vim.fs.dirname(path), upward = true })
	return not vim.tbl_isempty(check)
end

local function is_ansible_file(path, bufnr)
    -- Match Ansible file paths
    if path:match('tasks/.+%.y(a?)ml') or
            path:match('handlers/.+%.y(a?)ml') or
            path:match('roles/.+%.y(a?)ml') then
        return true
    end

    -- Match Ansible content
    local content = vim.filetype.getlines(bufnr)
    if type(content) == "table" then
        content = table.concat(content, "\n")
    end
    if content:match('hosts.*gather_facts') or
            content:match('ansible%.builtin') then
        return true
    end

    return false
end

local function ft_yaml(path, bufnr)
    print(path)
    -- Match Ansible
    if is_ansible_file(path, bufnr) then
        return 'yaml.ansible'
    end

    -- Match Helm
    if is_helm_file(path, bufnr) then
        return 'helm'
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
