local hide_patterns = {
  "*/compile_commands.json", -- 多层目录匹配
  "*/.git/*",
  "*/.git*/*",
  "*/.repo/*",
  "*/.cache/*",
  "*/_cacache/*",
  "*/.vscode-server/*",
  "*/.git*",
  "*/*.o",
  "*/*.cmd",
  "*/*.arm.d",
  "*/*.arm.o",
  "*/*.mod",
  "*/*.mod.c",
  "*/*.map",
  "*/*.a",
  "*/*.so",
  "*/*.ko",
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_gitignored = false,
        hide_by_pattern = hide_patterns,
      },
    },
  },
}


