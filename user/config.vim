set nu
set nocompatible
syntax on
syntax enable
set showmode
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set relativenumber


" set background=dark
colorscheme palenight
let g:airline_theme='palenight'

" lightline
let g:lightline = { 'colorscheme': 'palenight' }

set cursorline
" hi CursorLine term=bold cterm=bold ctermbg=237

set tags=./tags
set autochdir

" NERDTree
let NERDTreeShowHidden=1


if (has("termguicolors"))
      set termguicolors
endif
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
