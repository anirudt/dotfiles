" ============================================================
" ~/.vimrc — writing-first config (tex / prose)
" ============================================================

set nocompatible
filetype off

" ---- Plugin manager (vim-plug) ------------------------------
" Bootstrap: run this once in a shell, then open vim and :PlugInstall
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Distraction-free writing
Plug 'junegunn/goyo.vim'          " centred, padded writing mode  :Goyo
Plug 'junegunn/limelight.vim'     " dims paragraphs outside cursor
Plug 'reedes/vim-pencil'          " prose-friendly soft/hard wrap

" LaTeX (modern, actively maintained)
Plug 'lervag/vimtex'

" Quality-of-life for prose
Plug 'tpope/vim-abolish'          " :Subvert — case-smart substitution
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'           " fuzzy file/word search

" Lightweight statusline
Plug 'itchyny/lightline.vim'

call plug#end()
filetype plugin indent on

" ---- Basic appearance ---------------------------------------
syntax enable
set background=dark
set t_Co=256
set encoding=utf-8
set scrolloff=5
set laststatus=2
set noshowmode            " lightline shows mode

" ---- Line numbers -------------------------------------------
set number
set relativenumber

" ---- Prose defaults -----------------------------------------
set wrap
set linebreak             " break at word boundaries
set breakindent
set textwidth=0           " no hard-wrap; vim-pencil handles this
set formatoptions=l
set nojoinspaces          " one space after period


" ---- Search -------------------------------------------------
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>

" ---- Indentation --------------------------------------------
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" ---- Splits -------------------------------------------------
set splitbelow
set splitright

" ---- Word count in statusline -------------------------------
function! WordCount()
  return wordcount()['words'] . ' w'
endfunction

let g:lightline = {
  \ 'active': {
  \   'left':  [['mode','paste'],['filename','modified']],
  \   'right': [['wordcount'],['percent'],['filetype']]
  \ },
  \ 'component_function': { 'wordcount': 'WordCount' }
\ }

" ---- vimtex -------------------------------------------------
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
  \ 'options': ['-pdf', '-interaction=nonstopmode', '-synctex=1']
\ }
let g:tex_flavor = 'latex'

" ---- Goyo + Limelight integration ---------------------------
function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  set nonumber norelativenumber
  set conceallevel=0        " show apostrophes and all special chars
  syntax off                " no colour highlights in writing mode
  highlight clear SpellCap  " no proper-noun highlights
  highlight clear SpellBad
  Limelight
  SoftPencil
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=5
  set number relativenumber
  set conceallevel=2
  syntax enable
  Limelight!
  PencilOff
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" <leader>w enters writing mode (80% width so margins scale with font size)
nnoremap <leader>w :Goyo 80%x90%<CR>

let g:limelight_conceal_ctermfg = 240
let g:limelight_paragraph_span = 1

" ---- tex autocmds -------------------------------------------
augroup tex_writing
  autocmd!
  autocmd FileType tex setlocal textwidth=0
  autocmd FileType tex setlocal nospell
  " j/k navigate display lines (better for wrapped prose)
  autocmd FileType tex nnoremap <buffer> j gj
  autocmd FileType tex nnoremap <buffer> k gk
  autocmd FileType tex vnoremap <buffer> j gj
  autocmd FileType tex vnoremap <buffer> k gk
  " compile
  autocmd FileType tex nnoremap <buffer> <C-e> :VimtexCompile<CR>
augroup END

" ---- Key mappings -------------------------------------------
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Rg<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <leader>z :w<CR>
