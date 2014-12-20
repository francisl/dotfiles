syntax on
filetype indent plugin on
set modeline
filetype off
let mapleader=","
call pathogen#infect()
call pathogen#helptags()
set foldmethod=indent
set foldlevel=99
" nnoremap <leader>v <Plug>TaskList
map <leader>td <Plug>TaskList
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
