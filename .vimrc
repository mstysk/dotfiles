"#####表示設定#####
set title "編集中のファイル名を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定

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

"Bundle
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

"volt拡張子のファイルのカラーを設定
au! BufNewFile,BufRead *.volt set filetype=htmldjango
 
"Required:
"call neobundle#begin(expand('~/.vim/bundle/'))
 
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

