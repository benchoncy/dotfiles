-- Customize terminal buffer
vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Open a custom terminal buffer',
  group = vim.api.nvim_create_augroup('custom-terminal', { clear = true }),
  callback = function()
    -- Set terminal buffer options
    vim.opt.number = false
    vim.opt.relativenumber = false
    -- Enter insert mode automatically
    vim.cmd('startinsert')
  end,
})

-- Better escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Toggleable terminal window
local term_buf = nil

local function create_terminal_window()
  vim.cmd.vnew()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 15)
end

vim.keymap.set("n", "<leader>t", function()
  if term_buf == nil or not vim.api.nvim_buf_is_valid(term_buf) then
    -- Create a new terminal buffer
    create_terminal_window()
    vim.cmd.term()
    term_buf = vim.api.nvim_get_current_buf()
  else
    -- Check if the terminal buffer is already open in a window
    local buf_windows = vim.fn.win_findbuf(term_buf)
    if #buf_windows > 0 then
      -- If it is open, close that window
      for _, win in ipairs(buf_windows) do
        vim.api.nvim_win_close(win, true)
      end
    else
      -- If it is not open, open it in a new split at the bottom
      create_terminal_window()
      vim.api.nvim_set_current_buf(term_buf)
    end
  end
end, { noremap = true, silent = true })
