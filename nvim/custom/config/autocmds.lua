
local function augroup(name)
  return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- Auto remove trailing whitespace when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("remove_trailing_whitespace"),
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})
