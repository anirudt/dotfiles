syntax on

" color scheme enable
syntax enable
colorscheme monokai

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" numbering options
set number

" indent options
set ai

set incsearch
set hlsearch

set showmatch

set shiftwidth=2

set tabstop=8

set nocompatible
filetype off 

set rtp^=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""manage vundle
Plugin 'gmarik/Vundle.vim'

"""CtrlP plugin
Plugin 'kien/ctrlp.vim'

"""Powerline plugin
Plugin 'Lokaltog/vim-powerline'

Plugin 'powerline/powerline'

call vundle#end()
filetype plugin indent on

"Ctrlp fuzzy finder : thanks to Robin Ward
"for quick indexing by using git file listing => no files from gitignore, but untracked files
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

""" search through tags
let g:ctrlp_extensions = ['tag']
nmap <leader>p ;CtrlPTag<CR>

let g:Powerline_symbols = 'fancy'
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
