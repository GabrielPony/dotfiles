return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require("null-ls")

    config.sources = {
      null_ls.builtins.formatting.nixpkgs_fmt,

      null_ls.builtins.formatting.stylua.with({
        extra_args = { "--indent-type=Spaces", "--indent-width=4" },
      }),

      null_ls.builtins.formatting.black.with({
        extra_args = {
          "--tab-width=4",
          "--print-width=120",
        },
      }),

      null_ls.builtins.formatting.clang_format.with({
        extra_args = {
          "--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 120, \
                    AllowShortFunctionsOnASingleLine: Empty, \
                    AllowShortIfStatementsOnASingleLine: false, \
                    AllowShortLoopsOnASingleLine: false, \
                    SortIncludes: true, \
                    BreakBeforeBraces: Attach}",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
      }),

      null_ls.builtins.formatting.prettier.with({
        extra_args = { "--tab-width=4", "--print-width=120" },
      }),
    }

    local clang_format_files = {
      ".clang-format",
      "_clang-format",
    }

    local has_clang_format_config = function(utils)
      return utils.root_has_file(clang_format_files)
    end

    table.insert(config.sources, null_ls.builtins.formatting.clang_format.with({
      condition = has_clang_format_config,
    }))

    return config
  end,
}

