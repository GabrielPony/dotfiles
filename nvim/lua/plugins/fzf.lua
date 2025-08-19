local exclude_opts = {
  "compile_commands.json", -- 多层目录匹配
  ".log",
  ".git",
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
  ".mod.c",
  ".bin",
  ".tar"
}

local fd_exclude_args = vim.tbl_map(function(item)
  return '--exclude *' .. item .. '*'
end, exclude_opts)

local rg_exclude_args = vim.tbl_map(function(item)
    return '-g "!*' .. item .. '*"'
end, exclude_opts)

vim.env.FZF_DEFAULT_OPTS = "--color=bg:-1,bg+:-1,gutter:-1,fg:#ebdbb2,fg+:#fbf1c7,hl:#fabd2f,hl+:#fabd2f,info:#83a598,prompt:#bdae93,pointer:#83a598,marker:#fe8019,header:#665c54"

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts = opts or {}

    -- 合并 grep 配置，保留现有设置
    opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
      rg_opts        = "--column --line-number --no-heading --color=always --smart-case --no-ignore "
      .. table.concat(rg_exclude_args, " ") .. "--max-columns=4096 -e",
      multiprocess      = true,           -- run command in a separate process
      file_icons  = true,
      color_icons = true,
      git_icons   = false,
      no_header_i = true,
      no_header   = true
    })
    opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
      fd_opts = "--color=never --type f --hidden --follow --no-ignore " .. table.concat(fd_exclude_args, " "),
      multiprocess = true,
      file_icons = 1,
      color_icons = true,
      git_icons = false,
      header = false,
      no_header_i = true,
      cwd_prompt = false,
      actions = {
        ["ctrl-g"] = false
      },
      -- 添加透明配置
      winopts = {
        backdrop = 60,        -- 背景透明度
        border = "none",      -- 移除窗口边框
      },
      hls = {
        normal = "Normal",
        border = "FloatBorder",
      },
      -- fzf 原生透明选项
      fzf_opts = {
        ["--color"] = "bg:-1,bg+:-1,gutter:-1,fg:#ebdbb2,fg+:#fbf1c7,hl:#fabd2f,hl+:#fabd2f,info:#83a598,prompt:#bdae93,pointer:#83a598,marker:#fe8019,header:#665c54",
        ["--border"] = "none",  -- 移除 fzf 边框
        ["--margin"] = "0",     -- 移除边距
        ["--padding"] = "0",    -- 移除内边距
      },
    })


    -- 合并 files 配置，保留现有设置
    -- opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
    --   fd_opts = "--color=never --type f --hidden --follow --no-ignore " .. table.concat(fd_exclude_args, " "),
    --   multiprocess= true,           -- run command in a separate process
    --   file_icons  = 1,
    --   color_icons = true,
    --   git_icons   = false,
    --   header = false,
    --   no_header_i = true,  -- 禁用交互式 header
    --   cwd_prompt = false,
    --   actions = {
    --     ["ctrl-g"] = false
    --   }
    -- })

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
  end,
}
