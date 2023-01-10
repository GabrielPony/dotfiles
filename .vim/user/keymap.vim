let mapleader = " "
inoremap jk <ESC>

noremap <leader>c <C-w>c
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>i :PlugInstall<CR>

" WhichKey
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR> 

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easymotion
" nmap ss <Plug>(easymotion-s2)
" tagbar 
nmap <leader>t :TagbarToggle<CR>

