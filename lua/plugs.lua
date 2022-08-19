return require('packer').startup(function()
    -- Package manager--
    use 'wbthomason/packer.nvim'
    -- ColorScheme--
    use {
        'folke/tokyonight.nvim',
    }
    -- Nvim Tree--
    use { --
    	'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons', 
    	tag = 'nightly'
    }
    -- lualine plugin -- 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- bufferline plugin --
    use {
        'akinsho/bufferline.nvim', 
        tag = "v2.*", 
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'kdheepak/tabline.nvim',
        requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }
    use {
        'stevearc/aerial.nvim',
    }

    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
    }
end)

