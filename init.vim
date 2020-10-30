" プラグイン内でも使われる設定
set encoding=utf-8
scriptencoding utf-8

" スペースキーをLeaderに設定
let g:mapleader = "\<Space>"

" 楽だけど頭がバグる
" nnoremap ; :
" nnoremap : ;
" let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.vim/plugged')

" dein.tomlの内容
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'SirVer/ultisnips'
Plug 'mattn/vim-lsp-settings'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" dein_lazy.tomlの内容
Plug 'flazz/vim-colorschemes'
Plug 'mattn/vim-goimports'
Plug 'itchyny/lightline.vim'
Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'cespare/vim-toml'
" Plug 'Shougo/context_filetype.vim'
" Plug 'osyo-manga/vim-precious'

call plug#end()

filetype plugin indent on
syntax enable


if has('persistent_undo')
	let undo_path = expand('~/.config/nvim/undo')
	exe 'set undodir=' .. undo_path
	set undofile
endif

colorscheme gruvbox

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

""" ----- プラグインの設定 -----
" * asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 10

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noselect

" * vim-lsp
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_async_completion = 1

" set foldmethod=expr
" \ foldexpr=lsp#ui#vim#folding#foldexpr()
" \ foldtext=lsp#ui#vim#folding#foldtext()
" set foldlevel=100

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'} " icons require GUI
highlight clear LspWarningLine
let g:lsp_highlights_enabled = 0

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

autocmd BufWritePre <buffer> LspDocumentFormat
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" * ultisnips
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" * asyncomplete-ultisnips.vim
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsExpandTrigger="<C-k>"

if has('python3')
	call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
		\ 'name': 'ultisnips',
		\ 'whitelist': ['*'],
		\ 'completor': function('asyncomplete#sources#ultisnips#completor'),
		\ }))
endif

" lazyの設定
" * lightline.vim
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

" * lexima.vim
inoremap <C-l> <C-g>U<Right>

" * scrooloose/nerdtree
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" * nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

