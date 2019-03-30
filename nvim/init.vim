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
set hidden
set confirm
set whichwrap=b,s,h,l,<,>,[,]

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
"colorscheme snow

" file type indent
if has("autocmd")
    filetype plugin on
    filetype indent on
    au BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd FileType javascript setlocal ts=2 sts=4 sw=4
endif

" ==== plugins =====

" autozimu/LanguageClient-neovim
if dein#tap('LanguageClient-neovim')
    let g:LanguageClient_serverCommands = {
        \ 'php': ['~/.cache/dein/repos/github.com/roxma/LanguageServer-php-neovim/vendor/felixfbecker/language-server'],
        \ }
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> ln :call LanguageClient#textDocument_rename()<CR>

    " debug
    let g:LanguageClient_changeThrottle = 0.5
    let g:LanguageClient_loggingLevel = 'INFO'
    let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
    let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

endif

" vim-scripts/PDV--phpDocumentor-for-Vim
if dein#tap('PDV--phpDocumentor-for-Vim')
    inoremap <C-]> <Esc>:call PhpDocSingle()<CR>i
    nnoremap <C-]> :call PhpDocSingle()<CR>
    vnoremap <C-]> :call PhpDocSingle()<CR>
endif

" nathanaelkane/vim-indent-guides
if dein#tap('vim-indent-guides')
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 0
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey
endif

" quickrun
if dein#tap('vim-quickrun')
    let g:quickrun_no_default_key_mappings = 1
    nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>
endif

" lightline
if dein#tap('lightline')
  let g:lightline = {}
  let g:lightline.colorscheme = 'snow_dark'
endif

" vim-gitguter
if dein#tap('vim-gitgutter')
    let g:gitgutter_override_sign_column_highlight = 0
    highlight SignColumn ctermbg=blue
endif

if dein#tap('vim-javascript')
    let g:javascript_plugin_jsdoc = 1
endif

if dein#tap('gina.vim')
    nnoremap <Leader><Leader>g :<C-u>Gina status<CR>
endif
