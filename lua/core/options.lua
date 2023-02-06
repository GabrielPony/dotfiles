local options = {
    -- Edit
    ts = 4,
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,
    smarttab = true,
    --	nobackup = true,
    swapfile = true,
    undofile = true,
    ignorecase = true,
    smartcase = true,
    autoindent = true,
    -- 	nocompatible= true,
    -- list= true,
    hidden = true,
    mouse = "",
    -- Interface
    relativenumber = true,
    number = true,
    --	nowrap= true,
    linebreak = true,
    hlsearch = true,
    ruler = true,
    showcmd = true,
    laststatus = 2,
    belloff = all,
    termguicolors = true,
    wildmenu = true,
    title = true,
    signcolumn = "yes",
    cursorline = true,
    cursorlineopt = "number",
    conceallevel = 1,
    scrolloff = 2,
    sidescrolloff = 5
}

-- Encoding

for k, v in pairs(options) do
    vim.opt[k] = v
end
-- vim.opt[backspace] = "indent,eol,start"
-- showbreak=>>
-- backspace = indent,eol,start
-- completeopt=menu,menuone,noselect
-- includeexpr=substitute(v:fname,'\\.','/','g')
-- display+=lastline,msgsep
-- fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
-- fillchars+=diff:╱
-- encoding=utf-8

-- require('onedark').load()
