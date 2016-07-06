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

" delete backspaces in end of line
autocmd BufWritePre * :%s/\s\+$//e

" command search
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> <S-m> :<C-u>nohlsearch<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Switch to alternate files
map <C-n> :bnext<CR>
map <C-p> :bprevious<CR>

" rename current file
function Move(name)
    let path = expand('%:h') . '/' . a:name
    call rename(expand('%'), path)
    execute 'bd | e ' . path
endfunction
command! -nargs=1 Mv call Move(<q-args>)

" copy current file
function Copy(name)
    let path = expand('%:h') . '/' . a:name
    execute 'w ' . path . ' | e ' . path
endfunction
command! -nargs=1 Cp call Copy(<q-args>)

" remove current file
function Remove()
    execute 'bd | !rm ' . expand('%')
endfunction
command! Rm call Remove()

" for python
function PythonDebug()
   let prase = 'import pdb;pdb.set_trace()'
   execute ":normal o" . prase
endfunction
nnoremap <silent> <C-t> :<C-u>call PythonDebug()<CR>

function PythonEncoding()
   let prase = '# -*- coding:utf-8 -*-'
   execute ":normal O" . prase
endfunction
nnoremap <silent> <C-e> :<C-u>call PythonEncoding()<CR>

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
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_sql_checkers = ['sqlint']

call neobundle#end()

let g:indent_guides_enable_on_vim_startup = 1

augroup Html
  autocmd!
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal tabstop=2
augroup END

augroup Javascript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2
augroup END

augroup SQL
  autocmd!
  autocmd FileType sql setlocal shiftwidth=2
  autocmd FileType sql setlocal softtabstop=2
  autocmd FileType sql setlocal tabstop=2
augroup END

autocmd FileType go autocmd BufWritePre <buffer> Fmt

filetype plugin indent on
