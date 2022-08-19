-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- lualine setting --
--require('lualine').setup {
--    options = {
--        theme = 'onedark'
--    }
--}
require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
}

-- bufferline setting --
vim.opt.termguicolors = true
require'bufferline'.setup{
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
-- tabline setting --
require'tabline'.setup {
    -- Defaults configuration options
    enable = true,
    options = {
    -- If lualine is installed tabline will use separators configured in lualine by default.
    -- These options can be used to override those settings.
      section_separators = {'', ''},
      component_separators = {'', ''},
      max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
      show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
      show_devicons = true, -- this shows devicons in buffer section
      show_bufnr = false, -- this appends [bufnr] to buffer section,
      show_filename_only = false, -- shows base filename only instead of relative path in filename
      modified_icon = "+ ", -- change the default modified icon
      modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
      show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
    }
}

vim.cmd[[set guioptions-=e " Use showtabline in gui vim set sessionoptions+=tabpages,globals " store tabpages and globals in session   ]]


-- theme setting--
vim.g.tokyonight_transparent = false
vim.g.tokyonight_style = "storm";
vim.cmd[[colorscheme tokyonight]]


--telescope --
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
  },
  extensions = {
  }
}


-- lsp setting --
require("nvim-lsp-installer").setup {}

require("lspconfig").vimls.setup{
  on_attach = require("aerial").on_attach,
}
require'lspconfig'.gopls.setup{
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(signature_setup, bufnr)  -- Note: add in lsp client on-attach
    end,
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require "lsp_signature".setup{
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
}
require'lsp_signature'.on_attach(bufnr)


-- lsp aerial --
require('aerial').setup()

-- treesitter setting --
require'nvim-treesitter'.setup {
}
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "bash", "cpp", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript","*" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

