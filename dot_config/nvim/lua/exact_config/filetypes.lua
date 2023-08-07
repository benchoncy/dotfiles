-- Add or override filetype mappings

vim.filetype.add({
    pattern = {
      ['*.tf'] = 'terraform',
    },
})
