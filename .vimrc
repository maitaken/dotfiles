set number
set encoding=utf-8
set expandtab
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2
set nofoldenable
" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=/Users/jabaraster/.vim/bundle/neobundle.vim/
endif

set runtimepath+=$HOME/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

if has('lua') " lua機能が有効になっている場合・・・・・・①
  " コードの自動補完
  NeoBundle 'Shougo/neocomplete.vim'
  " スニペットの補完機能
  NeoBundle "Shougo/neosnippet"
  " スニペット集
  NeoBundle 'Shougo/neosnippet-snippets'
endif

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
  " Vim起動時にneocompleteを有効にする
  let g:neocomplete#enable_at_startup = 1
  " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case = 1
  " 3文字以上の単語に対して補完を有効にする
  let g:neocomplete#min_keyword_length = 3
  " 区切り文字まで補完する
  let g:neocomplete#enable_auto_delimiter = 1
  " 1文字目の入力から補完のポップアップを表示
  let g:neocomplete#auto_completion_start_length = 1
  " バックスペースで補完のポップアップを閉じる
  inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

  " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
  imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
  " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
  imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'KeitaNakamura/railscasts.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
" 多機能セレクタ
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'suy/vim-ctrlp-commandline'
" 構文エラーチェック
NeoBundle 'scrooloose/syntastic'
" プロジェクトツリー
NeoBundle 'scrooloose/nerdtree'

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"----------------------------------------------------------
" CtrlPの設定
"----------------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'

let g:vim_markdown_conceal = 0

"----------------------------------------------------------
" Syntasticの設定
"----------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']
" Javascript以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': [] }
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

autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
let g:vim_markdown_folding_disabled=1

inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>

let mapleader = "\<Space>"

map <Leader>i gg=<S-g><C-o><C-o>zz
