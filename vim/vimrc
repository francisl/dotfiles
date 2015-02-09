syntax on
filetype indent plugin on
set modeline
set number
filetype plugin indent on    " enable loading indent file for filetype
let mapleader=","

set exrc " load local vimrc for custom project

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray


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

" C++
let &path.="src/include,/usr/include/AL,"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


" Git
" %{fugitive#statusline()}

"" PYTHON
" django nose
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" VirtualEnv

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


