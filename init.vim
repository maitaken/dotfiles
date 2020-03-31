set number
set encoding=utf-8

" スワップファイルやバックアップファイルを作成しない
" set nobackup
" set noswapfile

" カーソルのある行を強調
set cursorline
set cursorcolumn

" コマンドライン補完
set wildmenu

" 空白の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" クリップボードと無名レジスタの紐付け
set clipboard+=unnamedplus

" 検索時の大文字を無視
" 検索文字に大文字がある場合は無視しない
set ignorecase
set smartcase
set hlsearch
set incsearch
set inccommand=split

" タブ幅系の設定
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set shiftround
set smarttab

let s:bin_toggle = 0
function! s:bin_toggle_method() 
	if s:bin_toggle == 0
		let s:bin_toggle = 1
		:%!xxd
	else
		let s:bin_toggle = 0
		:%!xxd -r
endfunction

let mapleader = "\<Space>"

" insert map
inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>

" normal map
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader> V
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
nnoremap <Leader>ac ggVGy
nnoremap <Leader>b :<C-u>call <SID>bin_toggle_method()<CR>

" operation map
onoremap ' i'
onoremap " i"
onoremap ( i(
onoremap [ i[
onoremap { i{
onoremap ` i`
onoremap < i<

nnoremap <Leader>atc :0r /Users/maitake/.config/nvim/templates/atcoder.cpp<CR>

" vi互換の動作の無効化
if &compatible
	set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#add(s:dein_repo_dir)

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	call dein#load_toml('~/dotfiles/dein.toml',{'lazy': 0})
	call dein#load_toml('~/dotfiles/dein_lazy.toml',{'lazy': 1})

	call dein#add('flazz/vim-colorschemes',{'merged': 0})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif


if has('persistent_undo')
	let undo_path = expand('~/.config/nvim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

colorscheme hybrid

