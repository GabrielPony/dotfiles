return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "c",
      "cpp",
      "python",
      "markdown",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
