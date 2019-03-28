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

" ==== plugins =====

" autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'php': ['~/.cache/dein/repos/github.com/roxma/LanguageServer-php-neovim/vendor/felixfbecker/language-server'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> ln :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

" vim-scripts/PDV--phpDocumentor-for-Vim
inoremap <C-]> <Esc>:call PhpDocSingle()<CR>i
nnoremap <C-]> :call PhpDocSingle()<CR>
vnoremap <C-]> :call PhpDocSingle()<CR>

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

