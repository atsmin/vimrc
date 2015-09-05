filetype off

set ff=unix
set fileencoding=utf-8
set number
set background=dark
set nocompatible
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set hlsearch
set pastetoggle=<f5>
" delete backspaces in end of line
autocmd BufWritePre * :%s/\s\+$//e

" plugin
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--max-line-length=99"
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

let g:indent_guides_enable_on_vim_startup = 1

function Pd()
   let magic_comment = 'import pdb;pdb.set_trace()'
   let pos = getpos(".")
   execute ":normal o" . magic_comment
   call setpos(".", pos)
endfunction

function Pe()
   let magic_comment = '# -*- coding:utf-8 -*-'
   let pos = getpos(".")
   execute ":normal O" . magic_comment
   call setpos(".", pos)
endfunction

command! Pd :call Pd()
command! Pe :call Pe()

" command search
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> <C-m> :<C-u>nohlsearch<CR><C-l>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate file
map <C-t> :bnext<CR>
map <C-r> :bprevious<CR>

filetype plugin indent on
syntax on
