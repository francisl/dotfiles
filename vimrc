syntax on
filetype indent plugin on
set modeline
set number
filetype plugin indent on    " enable loading indent file for filetype
let mapleader=","

call pathogen#infect()
call pathogen#helptags()

set foldmethod=indent
set foldlevel=99

" """""""""""""""
" PlUGINGS
"
" SUPER TAB plugin
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" Key mapping
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pep8_map='<leader>8'

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
