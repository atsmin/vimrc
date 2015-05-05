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
filetype off
" 行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//e

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
NeoBundle 'scrooloose/nerdtree'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

""""""""""""""""""""""""""""""
" Unit.vimの設定
" """"""""""""""""""""""""""""""
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
" noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
"set statusline+=%{fugitive#statusline()}

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
" NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

function Pd()
   let magic_comment = 'import pdb;pdb.set_trace()'
   let pos = getpos(".")
   execute ":normal i" . magic_comment
   call setpos(".", pos)
endfunction

function Pe()
   let magic_comment = '# -*- coding:utf-8 -*-'
   let pos = getpos(".")
   execute ":normal i" . magic_comment
   call setpos(".", pos)
endfunction

command! Pd :call Pd()
command! Pe :call Pe()

" command search
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
