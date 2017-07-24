syntax on

" color scheme enable
syntax enable
"autocmd FileType cpp colorscheme luna
colorscheme luna-term
set cursorline
hi CursorLine cterm=None ctermbg=0 ctermfg=white

highlight Comment cterm=italic


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

Plugin 'w0rp/ale'

Plugin 'powerline/powerline'

"""Jedi Plugin, needs pip before install
Plugin 'davidhalter/jedi-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'majutsushi/tagbar'

Plugin 'skywind3000/asyncrun.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'

""" Neocomplete - general purpose auto complete frontend
Plugin 'Shougo/neocomplete.vim'

Plugin 'vim-latex/vim-latex'

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
map <C-e> :AsyncRun make<CR>

set foldmethod=indent
nnoremap <Space> za

nmap <C-x> :TagbarToggle<CR>
let g:tagbar_show_linenumbers = 2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab


" Makefile keybindings
map <C-f> <Esc>:copen<CR>


if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

endif
nmap ; :

" Jedi settings
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "1"

""" Neocomplete settings
set completeopt=longest,menu,menuone
let g:neocomplete#enable_at_startup=1
" have selection on first option
let g:neocomplete#enable_auto_select = 1

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
