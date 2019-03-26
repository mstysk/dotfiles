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
" Required:

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
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
"source ~/.vimrc.golang


if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')

call dein#add('violetyk/neocomplete-php.vim')
call dein#add('vim-scripts/PDV--phpDocumentor-for-Vim')

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('ctrlpvim/ctrlp.vim')

call dein#end()

let g:neocomplete_php_locale = 'ja'

inoremap <C-L> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-L> :call PhpDocSingle()<CR>
vnoremap <C-L> :call PhpDocSingle()<CR>

filetype plugin indent on
