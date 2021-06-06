call plug#begin('~/.vim/plugged')
" help
Plug 'vim-jp/vimdoc-ja'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
" auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'tsuyoshicho/vim-efm-langserver-settings'
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
" color scheme
Plug 'cocopon/iceberg.vim'
Plug 'Rigellute/rigel'
call plug#end()

set helplang=ja,en
syntax on

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
" set hidden
set autowrite
set autoread

" swap
"set directory=~/backup

" quit all
noremap ,q :qa!<CR>

" color scheme
colorscheme rigel

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

" vim 
nnoremap <silent> <leader>load :source $MYVIMRC<CR>

" command line
set wildmenu
set wildmode=list,full

" highlint
set hlsearch
set incsearch

" colrscheme
set termguicolors

" snippet 
set completeopt=menuone,popup,noinsert,noselect
inoremap <expr><Tab>   pumvisible() ? "<C-n>" : "<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

" clipboard
set clipboard=unnamed
"
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

" language server protocol short cuts
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition))
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> gf <Plug>(lsp-document-format)
nmap <silent> [c <Plug>(lsp-previous-error)
nmap <silent> ]c <Plug>(lsp-next-error)
nmap <silent> E <Plug>(lsp-document-diagnostics)
nnoremap <silent> K :LspHover<CR>

" git 
nnoremap <leader>s :Gina status<CR>
nnoremap <leader>ch <Plug>(gina-index-checkout)

" fzf
noremap ff :GFiles <CR>
noremap fb :Buffers <CR>
noremap fa :Files <CR>
noremap <leader>p :FZFMru <CR>

" sonictemplate
let g:sonictemplate_vim_template_dir = [
            \ '$HOME/dotfiles/template',
            \ '$HOME/.vim/template'
            \]

" fern
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#default_exclude = '^\.\(.*\)\.\(.*\)\.swp\|.vim-lsp-settings\|.git\|.php_cs.cache'

augroup __fern__
    au!
    autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
augroup END

nnoremap ,t :<c-u>Fern. -drawer -stay -keep -toggle -reveal=%<CR>
nnoremap ,r :<c-u>Fern. -drawer -stay -keep -reveal=%<CR>

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

