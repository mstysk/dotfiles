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
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'KeitaNakamura/neodark.vim' " https://github.com/KeitaNakamura/neodark.vim
Plug 'vim-jp/vimdoc-ja'
Plug 'haya14busa/vim-open-googletranslate'
Plug 'tyru/open-browser.vim'
Plug 'liuchengxu/vista.vim' " https://github.com/liuchengxu/vista.vim
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'lambdalisue/gina.vim'
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
set spell
set spelllang=en,cjk
set wildmenu
set wildmode=full

" list charts
set listchars=tab:▸\ ,eol:¬

" color schema
colorscheme neodark

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

" configure shortcuts
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" window resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Fern configure
let g:fern#renderer = "devicons"
let g:fern#comparator = "lexical"

function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" auto completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set completeopt+=preview

" google translate
let g:opengoogletranslate#openbrowsercmd = 'electron-open --without-forcus'

" language server protocol short cuts
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition))
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> [c <Plug>(lsp-previous-error)
nmap <silent> ]c <Plug>(lsp-next-error)
nmap <silent> E <Plug>(lsp-document-diagnostics)
nnoremap <silent> K :LspHover<CR>

" VimDrawer
noremap <Leader><Leader> :VimDrawer<CR>

" Leaderf
let g:Lf_PreviewInPopup = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap ff :Leaderf file --popup<CR>

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
let g:vista_ctags_cmd = {
    \ 'haskell': 'hasktags -x -o - -c',
    \ }
let g:vista_fzf_preview = ['right:50%']
