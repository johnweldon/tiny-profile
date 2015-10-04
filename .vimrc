execute pathogen#infect()
syntax on
filetype plugin indent on

let g:godef_split=0
let g:godef_same_file_in_same_window=1

set modeline
set autoread
set autowrite
set noswapfile
set directory=

set nobomb
set encoding=utf8

set hlsearch

set number

set background=dark
set viminfo=""
set vb t_vb="<Esc>|10f"

if filereadable(findfile("~/.local.vimrc"))
    source ~/.local.vimrc
endif
