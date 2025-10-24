-- Use Ruff to set the colorcolumn based on the configured line length
local result = vim.system({ 'ruff', 'check', '--show-settings' }, { text = true }):wait()
local line_length
if result and result.code == 0 then
    line_length = result.stdout:match('linter%.line%plength%s*=%s*(%d+)')
else
    line_length = '88'
end
vim.opt_local.colorcolumn = line_length
