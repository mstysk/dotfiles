" plugin 
runtime! ./plugin.vim

" default settings
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
set spell
set spelllang=en,cjk

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
    au BufRead,BufNewFile *.sbt set filetype=scala
endif

" ==== plugins =====

" airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='cool'
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

" coc settings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

" coc nmap
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)


nnoremap <silent> F :call CocAction('format')<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" coc @see https://github.com/neoclide/coc.nvim
hi CocErrorSign ctermfg=15 ctermbg=196
hi CocWarningSign ctermfg=0 ctermbg=172

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <silent> <Leader>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <Leader>o  :<C-u>CocList outline<cr>
nnoremap <silent> <Leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <Leader>j  :<C-u>CocNext<CR>
nnoremap <silent> <Leader>k  :<C-u>CocPrev<CR>
nnoremap <silent> <Leader>p  :<C-u>CocListResume<CR>

" window resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" popupmenu
set pumblend=30
set winblend=30

hi Pmenu ctermbg=DarkGreen guifg=#E9E9E9 guibg=DarkGreen
hi PmenuSel ctermbg=DarkBlue guifg=#E9E9E9 guibg=DarkBlue

" word 
nnoremap ,? :!open https://ejje.weblio.jp/content/<cword><CR>

" config shortcuts
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" google translate
let g:opengoogletranslate#openbrowsercmd = 'electron-open --without-forcus'

" firenvim
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': 'textarea',
            \ 'priority': 0,
        \ }
    \ }
\ }

let g:dont_write = v:false

function! My_Write(timer) abort
    let g:dont_write = v:false
    write
endfunction

function! Delay_My_Write() abort
    if g:dont_write
        return
    end
    let g:dont_write = v:true
    call timer_start(10000, 'My_Write')
endfunction

au TextChanged * ++nested call Delay_My_Write()
au TextChangedI * ++nested call Delay_My_Write()

function! OnUIEnter(event)
    let l:ui = nvim_get_chan_info(a:event.chan)
    if has_key(l:ui, 'client') && has_key(l:ui.client, "name")
        if l:ui.client.name == "Firenvim"
            set laststatus=0
        endif
    endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
