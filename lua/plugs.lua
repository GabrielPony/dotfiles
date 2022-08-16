return require('packer').startup(function()
    -- Package manager--
    use 'wbthomason/packer.nvim'
    -- ColorScheme--
    use {
        'folke/tokyonight.nvim',
        vim.cmd[[colorscheme tokyonight]]
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
        vim.cmd[[set guioptions-=e " Use showtabline in gui vim set sessionoptions+=tabpages,globals " store tabpages and globals in session   ]],
        requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
    }

    --use {
    --  'stevearc/aerial.nvim',
    --   require('aerial').setup()
    --}
end)

