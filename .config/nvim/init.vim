call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'ayu-theme/ayu-vim'

call plug#end()

syntax on
set background=dark
let ayucolor="dark"
colorscheme ayu

set backspace=indent,eol,start
set nocompatible

filetype indent on
set nowrap
set number
set laststatus=2
set scrolloff=12
set ignorecase
set smartcase
set sidescroll=40
set incsearch
set hlsearch

set shiftwidth=4     " indent = 4 spaces
set tabstop=4        " tab = 4 spaces
set softtabstop=4    " backspace through spaces

let g:airline_powerline_fonts = 1
