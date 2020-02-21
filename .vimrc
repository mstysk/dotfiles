call plug#begin('~/.vim/plugged')
Plug 'thinca/vim-zenspace' "https://github.com/thinca/vim-zenspace
Plug 'ryanoasis/vim-devicons' "https://github.com/ryanoasis/vim-devicons
Plug 'lambdalisue/fern.vim' "https://github.com/lambdalisue/fern.vim
Plug 'lambdalisue/fern-renderer-devicons.vim' "https://github.com/lambdalisue/fern-renderer-devicons.vim
Plug 'lambdalisue/fern-comparator-lexical.vim' "https://github.com/lambdalisue/fern-comparator-lexical.vim
Plug 'junegunn/vim-easy-align' "https://github.com/junegunn/vim-easy-align
Plug 'machakann/vim-highlightedyank' "https://github.com/machakann/vim-highlightedyank
Plug 'nathanaelkane/vim-indent-guides' "https://github.com/nathanaelkane/vim-indent-guides
Plug 'thinca/vim-quickrun' "https://github.com/thinca/vim-quickrun
Plug 'samuelsimoes/vim-drawer' "https://github.com/samuelsimoes/vim-drawer
call plug#end()

set helplang=ja,en
syntax on
set nocompatible
set nobackup
set nowritebackup
set number
set list
set showtabline=2
set hidden
set confirm
set whichwrap=b,s,h,l,<,>,[,]
set cmdheight=2
set updatetime=300
set signcolumn=yes
set termguicolors "true colors
"set spell
"set spelllang=en,cjk

" list charts
set listchars=tab:▸\ ,eol:¬

" key mapping change
let mapleader="\<Space>"
nnoremap <Leader>w :<C-u>w<CR>
nnoremap ; :
nnoremap : ;

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" key map invalid
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" clipboard
set clipboard=unnamed

" cursor
set cursorline
hi CursorLine cterm=bold,underline

" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" terminal settings
tnoremap <silent> <ESC> <C-\><C-n>

" config shortcuts
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" window resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Fern config
let g:fern#renderer = "devicons"
let g:fern#comparator = "lexical"
