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
" colo elflord
colo seoul256

" terminal settings
tnoremap <silent> <ESC> <C-\><C-n>

" file type indent
if has("autocmd")
    filetype plugin on
    filetype indent on
    au BufRead,BufNewFile *.jsx set filetype=javascript
    autocmd FileType javascript setlocal ts=2 sts=4 sw=4
endif

" ==== plugins =====

" airline 
let g:airline#extensions#tabline#enabled = 1

" nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd vimEnter * NERDTree

" vim easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" language sercer protocol
au User lsp_setup call lsp#register_server({
    \ 'name': 'intelephense',
    \ 'cmd': {server_info->['node', expand("/Users/yoshioka/stady/npm2/lib/node_modules/intelephense/lib/intelephense.js"), '--stdio']},
    \ 'initialization_options': {"storagePath": "~/.local/share/intelephense"},
    \ 'whitelist': ['php'],
    \ })
let g:lsp_diagnostics_enabled = 0 

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=none
hi IndentGuidesEven ctermbg=darkgrey

" quick run
let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>

" ale
let g:ale_fixers = {}
let g:ale_fixers['php'] = ['php_cs_fixer']
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
 
" pdv
let g:pdv_template_dir = expand('~/.config/nvim/pdv/templates_snip')
nnoremap <C-]> :call pdv#DocumentWithSnip()<CR>

" ref
let g:ref_phpmanual_path =  "${HOME}/.config/nvim/manual/php_manual_ja.html"
