call plug#begin('~/.vim/plugged')
" help
Plug 'vim-jp/vimdoc-ja'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'tsuyoshicho/vim-efm-langserver-settings'
" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
" fazzy finder
Plug 'junegunn/fzf', { 'do': { -> 'fzf#install()' }}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
" dir file
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-reload-all.vim'
" git
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" support
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/vim-sonictemplate'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/nerdfont.vim'
Plug 'skanehira/translate.vim'
Plug 'wakatime/vim-wakatime'
Plug 'direnv/direnv.vim'
Plug 'editorconfig/editorconfig-vim'
" color scheme
Plug 'cocopon/iceberg.vim'
Plug 'Rigellute/rigel'
" debug
Plug 'vim-vdebug/vdebug'
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
" markdown
Plug 'tpope/vim-markdown'
" Twig
" Plug 'lumiliet/vim-twig'
Plug 'nelsyeung/twig.vim'

call plug#end()

set helplang=ja,en
syntax on

" 十字キー off
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" display
set nu
set cmdheight=2
set signcolumn=yes

" list charts
set list
set listchars=tab:▸\ ,eol:¬

" tab
set showtabline=2

" buf
set autowrite
set autoread

" swap
set directory=~/backup

" color scheme
colorscheme iceberg 

" key mapping change
let mapleader="\<Space>"
nnoremap <Leader>w :<C-u>w<CR>
nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" command line
set wildmenu
set wildmode=list,full

" highlight
set hlsearch
set incsearch

" clipboard
set clipboard=unnamed

" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" window resize
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" git 
nnoremap <leader>s :Gina status<CR>
nnoremap <leader>ch <Plug>(gina-index-checkout)

" bengo4 com develop
call extend(g:gina#command#browse#translation_patterns, {
    \ 'gitlab-docker\.bengo4\.com': [
    \   [
    \     '\vhttps?://(%domain)/(.{-})/(.{-})%(\.git)?$',
    \     '\vgit://(%domain)/(.{-})/(.{-})%(\.git)?$',
    \     '\vgit\@(%domain):(.{-})/(.{-})%(\.git)?$',
    \     '\vssh://git\@(%domain)/(.{-})/(.{-})%(\.git)?$',
    \   ], {
    \     'root':  'https://\1/\2/\3/tree/%r1/',
    \     '_':     'https://\1/\2/\3/blob/%r1/%pt%{#L|}ls%{-}le',
    \     'exact': 'https://\1/\2/\3/blob/%h1/%pt%{#L|}ls%{-}le',
    \   },
    \ ],
    \})

" fzf
noremap ff :GFiles <CR>
noremap fb :Buffers <CR>
noremap fa :Files <CR>
noremap <leader>p :FZFMru <CR>

" fern
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1

" vim-lsp
imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> E <Plug>(lsp-document-diagnostics)
"    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" lsp debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" Fern
nnoremap ,t :<c-u>Fern. -drawer -stay -keep -toggle -reveal=%<CR>
nnoremap ,r :<c-u>Fern. -drawer -stay -keep -reveal=%<CR>

if executable('efm-langserver')
  augroup LspEFM
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'efm-langserver',
        \ 'cmd': {server_info->['efm-langserver', '-c='.$HOME.'/.config/efm-langserver/config.yaml']},
        \ 'whitelist': ['php'],
        \ })
  augroup END
endif

let g:lsp_format_sync_timeout = -1

" php xdebug
let g:vdebug_options = {
\    'port' : 9003,
\    'timeout' : 20,
\    'server' : '127.0.0.1',
\    'on_close' : 'stop',
\    'break_on_open' : 1,
\    'ide_key' : 'PHPSTORM',
\    'debug_window_level' : 0,
\    'debug_file_level' : 1,
\    'debug_file' : $HOME.'/vdebug.log',
\    'path_maps' : {},
\    'watch_window_style' : 'expanded',
\    'marker_default' : '⬦',
\    'marker_closed_tree' : '▸',
\    'marker_open_tree' : '▾',
\    'sign_breakpoint' : '▷',
\    'sign_current' : '▶',
\    'continuous_mode'  : 1,
\    'simplified_status': 1,
\    'layout': 'vertical',
\}

let g:sonictemplate_vim_template_dir = [
      \ '~/dotfiles/template'
      \]

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'php']

" colorcolumn
set cc=80,120,240

" twig filetype
"autocmd BufNewFile,BufRead *.twig set filetype=twig
