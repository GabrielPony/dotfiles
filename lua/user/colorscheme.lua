vim.cmd [[
try
  colorscheme everforest  
  set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
