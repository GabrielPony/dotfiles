
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- 删除行尾空格
        trim_trailing_whitespace = {
          {
            event = "BufWritePre", -- 在保存文件之前触发
            desc = "Delete Blank Space When Save Files",
            callback = function()
              local cursor_pos = vim.api.nvim_win_get_cursor(0)
              vim.cmd([[%s/\s\+$//e]])
              vim.cmd([[%s/\r//ge]])
              -- vim.cmd([[set ff=unix]])
              vim.api.nvim_win_set_cursor(0, cursor_pos)
            end,
          },
        },
      },
    },
  },
}

