return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",

  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "c",
      "cpp",
      "nix",
      "python",
      "markdown",
      -- add more arguments for adding more treesitter parsers
    },
    highlight = { enable = true },
    indent = { enable = true },
    -- 如果有 textobjects 配置，也写在这里
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },
    },
  },
}
