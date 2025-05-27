return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = false,
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
  },
}
