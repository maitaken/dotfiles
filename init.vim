" プラグイン内でも使われる設定
set encoding=utf-8
scriptencoding utf-8

" スペースキーをLeaderに設定
let g:mapleader = "\<Space>"

" 楽だけど頭がバグる
" nnoremap ; :
" nnoremap : ;

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#add(s:dein_repo_dir)

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	let s:rc_dir = expand('~/dotfiles/')
	let s:toml = s:rc_dir . '/dein.toml'
	let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 0})

	call dein#add('flazz/vim-colorschemes',{'merged': 0})

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
	call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
	call map(s:removed_plugins, "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endif

if has('persistent_undo')
	let undo_path = expand('~/.config/nvim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

colorscheme alduin

set number

" スワップファイルやバックアップファイルを作成しない
set nobackup
set noswapfile

" カーソルのある行を強調
set cursorline

" コマンドライン補完
set wildmenu

" 空白の可視化
set list
set listchars=tab:\¦\ ,trail:_,extends:>,precedes:<,nbsp:%

" クリップボードと無名レジスタの紐付け
" set clipboard&
set clipboard^=unnamedplus

" 検索時の大文字を無視
" 検索文字に大文字がある場合は無視しない
set ignorecase
set smartcase
set hlsearch
set incsearch
if has('nvim')
  set inccommand=split
endif

" タブ幅系の設定
set tabstop=4
set shiftwidth=2
set autoindent
set smartindent
set shiftround
set smarttab

" Windowを下に作るように設定
set splitbelow
set splitright

" helpを日本語優先にする
set helplang=ja

" カーソル移動時に上下に10行余裕を持つ
set scrolloff=10

" 矩形選択時の設定
set virtualedit=block

" insert map
inoremap <silent> <C-j> <ESC>

" normal map
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader> V
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Leader>ac ggVGy

nnoremap <silent> <Leader>l 10<C-w>>
nnoremap <silent> <Leader>h 10<C-w><<
nnoremap <silent> <Leader>j 10<C-w>-
nnoremap <silent> <Leader>k 10<C-w>+

" Tab移動
nnoremap <silent> <Leader>. :new ~/dotfiles/init.vim<CR>
nnoremap <silent> <Leader>s :source ~/dotfiles/init.vim<CR>

noremap <Leader>vt :vsplit +terminal<CR><C-w>20<
" nnoremap <Leader>st :split<CR>:terminal<CR><C-w>20-

" 普段使わないキーの無効化
nnoremap Q <Nop>
nnoremap q <Nop>

" operation map
onoremap ' i'
onoremap " i"
onoremap ( i(
onoremap [ i[
onoremap { i{
onoremap ` i`
onoremap < i<

" terminal map
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-j> <C-\><C-n>

nnoremap <Leader>atc :0r /Users/maitake/.config/nvim/templates/atcoder.cpp<CR>
nnoremap <Leader>atg :0r /Users/maitake/.config/nvim/templates/main.go<CR>
