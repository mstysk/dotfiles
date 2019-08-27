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

" clipboard
set clipboard+=unnamedplus

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
" coc
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" nerdtree
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd vimEnter * NERDTree

" vim easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=none
hi IndentGuidesEven ctermbg=darkgrey

" quick run
let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>

" pdv
let g:pdv_template_dir = expand('~/.config/nvim/pdv/templates_snip')
nnoremap <C-]> :call pdv#DocumentWithSnip()<CR>

" ref
let g:ref_phpmanual_path =  "${HOME}/.config/nvim/manual/php_manual_ja.html"

" vim-javascript
let g:javascript_plugin_flow = 1

" coc @see https://github.com/neoclide/coc.nvim
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

" coc key map
nmap <silent> <Leader><Leader> :<C-u>CocList<cr>
nmap <silent> <Leader>df <Plug>(coc-definition)
nmap <silent> <Leader>h :<C-u>call CocAction('doHover')<cr>
nmap <silent> <Leader>df <Plug>(coc-definition)
nmap <silent> <Leader>rf <Plug>(coc-references)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>fmt <Plug>(coc-format)

