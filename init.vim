set number
set encoding=utf-8

" スワップファイルやバックアップファイルを作成しない
set nobackup
set noswapfile

" カーソルのある行を強調
set cursorline

" 空白の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

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
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set shiftround

filetype on
let mapleader = "\<Space>"

" 設定ファイルの読み込みPath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')

  call dein#add('itchyny/lightline.vim')

  " Color Scheme
  call dein#add('tomasr/molokai')
  call dein#add('romainl/Apprentice')
  call dein#add('freeo/vim-kalisi')
  call dein#add('jacoborus/tender.vim')

  call dein#add('fatih/vim-go')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('yuttie/comfortable-motion.vim')
  call dein#add('w0rp/ale')
  call dein#add('cohama/lexima.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('easymotion/vim-easymotion')

  call dein#end()
  call dein#save_state()
endif

" deoplete Config
let g:deoplete#enable_at_startup = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-y>" : "\<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


" NERDTree Config
function s:MoveToFileAtStart()
  call feedkeys("\<C-w>")
  call feedkeys("\l")
endfunction
autocmd VimEnter * NERDTree | call s:MoveToFileAtStart()

let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ale Config

let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" vim-gitgutter Config
nnoremap <silent> <C-g><C-n> <Plug>GitGutterNextHunk
nnoremap <silent> <C-g><C-p> <Plug>GitGutterPrevHunk

inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>


colorscheme molokai

