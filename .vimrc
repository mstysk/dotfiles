"#####表示設定#####
set title "編集中のファイル名を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定

set ignorecase "大文字/小文字の区別なく検索する

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
"
"vi互換をオフする
""スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"タブの代わりに空白文字を指定する
set expandtab

""行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"自動クリップボード
set clipboard=unnamed

set shiftwidth=2

"if has('vim-starting')
"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"endif
"Required:
"call neobundle#begin(expand('~/.vim/bundle/'))
"NeoBundleFetch 'Shougo/neobundle.vim'
"call neobundle#end()
"NeoBundleCheck



"Bundle
" bundleで管理するディレクトリを指定

"volt拡張子のファイルのカラーを設定
au! BufNewFile,BufRead *.volt set filetype=htmldjango
 
 
" neobundle自体をneobundleで管理
"NeoBundleFetch 'Shougo/neobundle.vim'

"クリップボード有効化
"NeoBundle 'kana/vim-fakeclip.git'

" solarized
"NeoBundle 'altercation/vim-colors-solarized'
" mustang
"NeoBundle 'croaker/mustang-vim'
" jellybeans
"NeoBundle 'nanotech/jellybeans.vim'
" molokai
"NeoBundle 'tomasr/molokai'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'etaoins/vim-volt-syntax'

"call neobundle#end()



"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/yoshiokamasato/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/yoshiokamasato/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'digitaltoad/vim-jade'
"NeoBundle 'mattn/jscomplete-vim'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'nathanaelkane/vim-indent-guides'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
"
NeoBundle 'fatih/vim-go'
"
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"
"let g:jscomplete_use = ['dom', 'moz', 'es6th']
"let g:syntastic_javascript_checker = "jslint"

"vim-indent-guides
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=18
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=19
"let g:indent_guides_color_change_percent = 30
"let g:indent_guides_guide_size = 1



"全角スペースをハイライト表示
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
	autocmd!
	autocmd ColorScheme       * call ZenkakuSpace()
	autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif


"Go
source ~/.vimrc.golang
