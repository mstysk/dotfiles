nnoremap ; :
nnoremap : ;

" terminal setup

set sh=zsh
tnoremap <silent> <ESC> <C-\><C-n>

" command set upset 
syntax on
set number
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround

set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

inoremap <silent> jj <ESC>:<C-u>w<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/yoshioka/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/yoshioka/.cache/dein')
  call dein#begin('/Users/yoshioka/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/yoshioka/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  call dein#add('scrooloose/nerdtree')
  "call dein#add('padawan-php/deoplete-padawan')
  call dein#add('lvht/phpcd.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('kassio/neoterm')
  call dein#add('dracula/vim')
  call dein#add('itchyny/vim-gitbranch')
  call dein#add('vim-scripts/PDV--phpDocumentor-for-Vim') 
  " call dein#add('tpope/vim-fugitive')
  call dein#add('kovisoft/slimv')
  call dein#add('andymass/vim-matchup')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('nathanaelkane/vim-indent-guides')
  " call dein#add('cohama/lexima.vim')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('mechatroner/rainbow_csv')
  call dein#add('scrooloose/syntastic.git')
  call dein#add('chase/vim-ansible-yaml')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['phpcd', 'omni']
 let g:deoplete#ignore_sources.php = ['omni']

" Tree Mode
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

" Color scheme
colorscheme elflord

" Ctrip
let g:ctrlp_working_path_mode=0

" NeoTerm
nnoremap <silent> <C-t> :botright 2Topen<CR>
let g:neoterm_autoscroll=1
tnoremap <silent> <ESC> <C-\><C-n><C-w>
tnoremap <silent> <C-d> exit<CR>

" lioghtline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" php-doc-modded
inoremap <C-]> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-]> :call PhpDocSingle()<CR> 
vnoremap <C-]> :call PhpDocRange()<CR>
" inoremap <C-]> <ESC>:call pdv#DocumentWithSnip()<CR>
" nnoremap <C-]> :call pdv#DocumentWithSnip()<CR> 
" vnoremap <C-]> :call pdv#DocumentWithSnip()<CR>
"let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
"nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>

" slimv of roswell
" let g:slimv_swank_cmd = "!ros -e '(ql:quickload :swank) (swank:create-server)' wait &"
let g:slimv_lisp = 'ros run'
let g:slimv_impl = 'sbcl'

" indent 
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Two-byte space 全角空白
"autocmd ColorScheme *.php hi link TwoByteSpace Error
"autocmd VimEnter,WinEnter *.php let w:m_tbs = matchadd("TwoByteSpace", '　')
hi link TwoByteSpace Error
let w:m_tbs = matchadd("TwoByteSpace", '　')

" Cursorline
set cursorline
hi CursorLine cterm=bold,underline

" list
set list

autocmd FileType javascript setlocal ts=2 sts=4 sw=4
autocmd FileType yaml setlocal filetype=ansible

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
