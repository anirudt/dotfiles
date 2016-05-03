syntax on

" color scheme enable
syntax enable
"autocmd FileType cpp colorscheme luna
colorscheme luna-term

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" numbering options
set relativenumber

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

Plugin 'jiangmiao/auto-pairs'

Plugin 'Raimondi/delimitMate'


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

" Tab mapping
"""switching between tabs
map <C-PageUp> :tabprevious<CR>
map <C-PageDown> :tabnext<CR>

""" new tab creation
map tn <Esc>:tabnew<CR>

set foldmethod=indent
nnoremap <Space> za

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
