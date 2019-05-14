set number
set encoding=utf-8
set tabstop=2


" 設定ファイルの読み込みPath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')
  
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/neocomplete.vim')

  call dein#add('fatih/vim-go')
	call dein#add('scrooloose/nerdtree')
	call dein#add('nathanaelkane/vim-indent-guides')

  call dein#end()
  call dein#save_state()
endif

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


inoremap <silent> jj <ESC>
inoremap <silent> っj <ESC>
