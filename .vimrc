set number
set showmatch

set encoding=utf-8

set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2
" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=/Users/jabaraster/.vim/bundle/neobundle.vim/
endif

set runtimepath+=/Users/maitake/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('/Users/maitake/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'KeitaNakamura/railscasts.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

syntax enable
set background=dark 
colorscheme railscasts 


let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set laststatus=2

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'
