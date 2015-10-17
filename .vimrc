filetype off

set ff=unix
set fileencoding=utf-8
" Spaces & Tabs
set expandtab
set tabstop=4
set softtabstop=4
" UI Config
syntax on
set number
set background=dark
set nocompatible
set autoindent
set shiftwidth=4
set pastetoggle=<C-k>
set cursorline
" Searching
set incsearch
set hlsearch
" Folding
set foldenable
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
" Movement
" move to beginning/end of line
nnoremap B ^
nnoremap E $

set autochdir

" delete backspaces in end of line
autocmd BufWritePre * :%s/\s\+$//e

" plugin
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--max-line-length=99"

call neobundle#end()

let g:indent_guides_enable_on_vim_startup = 1

function Pd()
   let text = 'import pdb;pdb.set_trace()'
   let pos = getpos(".")
   execute ":normal o" . text
   call setpos(".", pos)
endfunction

function Pe()
   let text = '# -*- coding:utf-8 -*-'
   let pos = getpos(".")
   execute ":normal O" . text
   call setpos(".", pos)
endfunction
nnoremap <silent> <C-t> :<C-u>call Pd()<CR>
nnoremap <silent> <C-e> :<C-u>call Pe()<CR>

" command search
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> <S-m> :<C-u>nohlsearch<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-n> :bnext<CR>
map <C-p> :bprevious<CR>

filetype plugin indent on
