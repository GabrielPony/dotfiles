-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.motion.flash-nvim" },
    { import = "astrocommunity.motion.marks-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
    { import = "astrocommunity.colorscheme.kanagawa-nvim" },
    { import = "astrocommunity.color.vim-highlighter" },
    -- { import = "astrocommunity.color.transparent-nvim" },
    { import = "astrocommunity.note-taking.obsidian-nvim" },
    { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
    { import = "astrocommunity.search.grug-far-nvim" },
    -- { import = "astrocommunity.utility.noice-nvim" },
    { import = "astrocommunity.completion.blink-cmp" },
    { import = "astrocommunity.fuzzy-finder.fzf-lua" },
    { import = "astrocommunity.editing-support.neogen" },
    -- TODO need change to this repo.

    -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
    -- import/override with your plugins folder
}
