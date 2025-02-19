local exclude_opts = {
  "compile_commands.json", -- 多层目录匹配
  ".git*",
  ".gitignore",
  ".repo",
  ".cache",
  "_cacache",
  ".vscode-server",
  ".o",
  ".cmd",
  ".arm.d",
  ".arm.o",
  ".mod",
  ".mod.c"
}

local fd_exclude_args = vim.tbl_map(function(item)
  return "--exclude " .. item
end, exclude_opts)

local rg_exclude_args = vim.tbl_map(function(item)
    return '-g "!' .. item .. '"'
end, exclude_opts)


return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts = opts or {}

    -- 合并 grep 配置，保留现有设置
    opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
      rg_opts        = "--column --line-number --no-heading --color=always --smart-case --hidden --no-ignore "
      .. table.concat(rg_exclude_args, " ") .. "--max-columns=4096 -e",
      no_header_i = true,
      header = false,
    })

    -- 合并 files 配置，保留现有设置
    opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
      fd_opts = "--color=never --type f --hidden --follow --no-ignore " .. table.concat(fd_exclude_args, " "),
      toggle_ignore_flag = "",
      no_header_i = true,  -- 禁用交互式 header
      header = false,
      cwd_prompt = false,
      actions = {
        ["ctrl-g"] = false
      }
    })

    -- 窗口配置
    opts.winopts = {
      -- 统一边框和窗口样式
      border = "single",  -- 可以尝试 single, rounded, double
      preview = {
        border = "single",
        scrollbar = false,
        -- 预览窗口与主窗口保持一致
        title_pos = "center",
        title = " Preview",
      },
      -- 窗口透明度和位置
      width = 0.8,    -- 占屏幕宽度的 80%
      height = 0.7,   -- 占屏幕高度的 70%
      preview_pos = "right", -- 预览窗口位置
      transparent = true,
    }

    -- 精细化颜色配置
    opts.fzf_colors = {
      ["bg"]      = { "bg", "Normal" },
      ["fg"]      = { "fg", "Normal" },
      ["border"]  = { "fg", "FloatBorder" },
      ["bg+"]     = { "bg", "CursorLine" },
      ["fg+"]     = { "fg", "CursorLine" },
    }

    return opts
  end,
}
