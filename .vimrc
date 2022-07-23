syntax enable

set number
set incsearch
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set wildmenu
set laststatus=2

let mapleader = '\<Space>'

inoremap <C-j> <ESC>

nnoremap <ESC><ESC> :nohlsearch<CR>

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:rc_dir = expand('~/dotfiles/')
let s:toml = s:rc_dir . '/dein.toml'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy': 0})
endif

if dein#check_install()
    call dein#install()
endif


