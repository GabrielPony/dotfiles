-- Customize Mason plugins

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "stylua",
        "pyright",   -- need python3 and pip3 to be supported
        "tree-sitter-cli",
        "clang-format",  -- install sudo apt install -y python3-venv to solve install failed issue
      },
    },
  },
}
