" plugin 
runtime! ./plugin.vim

" default settings
set helplang=ja,en
syntax on
set nocompatible
set nobackup
set number
set list
set showtabline=2

" key mapping change
nnoremap ; :
nnoremap : ;

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" key map invalid
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" cursor
set cursorline
hi CursorLine cterm=bold,underline

" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" search setting
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" two byte space
autocmd Colorscheme * hi TwoByteSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
autocmd VimEnter,WinEnter * match TwoByteSpace /　/

" color scheme
colorscheme elflord

