-- vim:foldmethod=marker
---@diagnostic disable: different-requires
-- Automatically download lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- vim.opt.runtimepath:prepend(lazypath)
plugins = {
  {
    "goolord/alpha-nvim",
    config = function()
      require "interface.alpha"
    end,
  },
  {
      "navarasu/onedark.nvim",
      name = "onedark",
      config = function()
        require "colorscheme.onedark"
      end,
  },
  {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require "colorscheme.catppuccin"
      end,
      build = ":CatppuccinCompile",
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require "colorscheme.rose-pine"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "tool.nvim-tree"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
    -- keys = {
    --   { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" },
    -- },
    -- enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require "tool.neo-tree"
    end,
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
    enabled = false,
  },
  {
    "TimUntersberger/neogit",
    config = function()
      require "tool.neo-git"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    -- keys = {
    --   { "<leader>gg", "<Cmd>Neogit<CR>", desc = "Open Neogit" },
    -- },
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require "tool.diffview"
    end,
    -- keys = {
    --   { "<leader>gdo", "<Cmd>DiffviewOpen<CR>", desc = "Open" },
    --   { "<leader>gdc", "<Cmd>DiffviewClose<CR>", desc = "Close" },
    --   { "<leader>gdh", "<Cmd>DiffviewFileHistory<CR>", desc = "Open History" },
    -- },
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require "tool.aerial"
    end,
    -- keys = {
    --   { "<leader>a", "<Cmd>AerialToggle<CR>", desc = "Outline" },
    -- },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "debug.dap"
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require "interface.noice"
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "core.treesitter"
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "nvim-treesitter/nvim-treesitter-refactor" },
      { "windwp/nvim-ts-autotag" },
      { "mrjones2014/nvim-ts-rainbow" },
      { "RRethy/nvim-treesitter-endwise" },
      { "RRethy/nvim-treesitter-textsubjects", enabled = false },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "efficiency.telescope"
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-hop.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
    },
    branch = "0.1.x",
    event = "VeryLazy",
  },
  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require "tool.toggleterm"
    end,
    version = "v2.*",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "core.lspconfig"
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    after = "mason.nvim",
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require "edit.snip"
    end,
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "core.mason"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "edit.cmp"
    end,
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-calc" },
      { "saadparwaiz1/cmp_luasnip" },
      { "kristijanhusak/vim-dadbod-completion" },
      { "lukas-reineke/cmp-under-comparator" },
    },
    event = "VeryLazy",
  },
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require "language.clangd_extensions"
    end,
    ft = {
      "c",
      "cpp",
      "objc",
      "objcpp",
      "cuda",
      "proto",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "interface.lualine"
    end,
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
      -- { "ofseed/lualine-copilot" },
    },
  },
  {
    "akinsho/nvim-bufferline.lua",
    config = function()
      require "interface.bufferline"
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      require "tool.markdown-preview"
    end,
    build = "cd app && yarn install",
    ft = { "markdown" },
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require "interface.lspkind"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "interface.ufo"
    end,
    dependencies = "kevinhwang91/promise-async",
  },
  {
    "folke/which-key.nvim",
    config = function()
      require "core.which-key"
    end,
  },
}

options = {
  root = vim.fn.stdpath "data" .. "/lazy", -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "--since=3 days ago" }, -- show commits from the last 3 days
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
  },
  dev = {
    -- directory where you store your local plugin projects
    path = "~/Documents/code/nvim",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      keys = " ",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
    },
    throttle = 20, -- how frequently should the ui process render events
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath "state" .. "/lazy/cache",
      -- Once one of the following events triggers, caching will be disabled.
      -- To cache all modules, set this to `{}`, but that is not recommended.
      -- The default is to disable on:
      --  * VimEnter: not useful to cache anything else beyond startup
      --  * BufReadPre: this will be triggered early when opening a file from the command line directly
      disable_events = { "VimEnter", "BufReadPre" },
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to indluce in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
}

require("lazy").setup(plugins,options)
