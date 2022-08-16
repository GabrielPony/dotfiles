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
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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

end)

