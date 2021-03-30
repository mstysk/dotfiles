call plug#begin('~/.vim/plugged')
Plug 'thinca/vim-zenspace' "https://github.com/thinca/vim-zenspace
Plug 'ryanoasis/vim-devicons' "https://github.com/ryanoasis/vim-devicons
Plug 'lambdalisue/fern.vim' "https://github.com/lambdalisue/fern.vim
" Plug 'lambdalisue/fern-renderer-devicons.vim' "https://github.com/lambdalisue/fern-renderer-devicons.vim
Plug 'lambdalisue/fern-comparator-lexical.vim' "https://github.com/lambdalisue/fern-comparator-lexical.vim
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'junegunn/vim-easy-align' "https://github.com/junegunn/vim-easy-align
Plug 'machakann/vim-highlightedyank' "https://github.com/machakann/vim-highlightedyank
Plug 'nathanaelkane/vim-indent-guides' "https://github.com/nathanaelkane/vim-indent-guides
Plug 'thinca/vim-quickrun' "https://github.com/thinca/vim-quickrun
" Plug 'samuelsimoes/vim-drawer' "https://github.com/samuelsimoes/vim-drawer
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
" Plug 'high-moctane/asyncomplete-nextword.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'KeitaNakamura/neodark.vim' " https://github.com/KeitaNakamura/neodark.vim
Plug 'smallwat3r/vim-simplicity' " https://github.com/smallwat3r/vim-simplicity
Plug 'olivertaylor/vacme' " https://github.com/olivertaylor/vacme
Plug 'vim-jp/vimdoc-ja'
Plug 'tyru/open-browser.vim'
Plug 'liuchengxu/vista.vim' " https://github.com/liuchengxu/vista.vim
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'lambdalisue/gina.vim'
Plug 'tsuyoshicho/vim-efm-langserver-settings'
Plug 'skanehira/translate.vim'
Plug 'previm/previm'
Plug 'Rigellute/rigel'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'zxqfl/tabnine-vim'
" Plug 'cohama/lexima.vim'
Plug 'airblade/vim-gitgutter'
Plug 'phpstan/vim-phpstan'
Plug 'dense-analysis/ale'
" Plug 'scrooloose/nerdtree'
Plug 'mattn/vim-sonictemplate'
Plug 'lighttiger2505/sqls.vim'
Plug 'schickling/vim-bufonly'
Plug 'mhinz/vim-startify' " https://github.com/mhinz/vim-startify#installation-and-documentation
Plug 'gu-fan/simpleterm.vim'
Plug 'kyoh86/vim-editerm'
Plug 'AndrewRadev/linediff.vim'
Plug 'preservim/nerdcommenter'
Plug 'mattn/vim-findroot'
Plug 'easymotion/vim-easymotion'
Plug 'wakatime/vim-wakatime' "see https://wakatime.com/vim
Plug 'cocopon/iceberg.vim'
" Plug 'vim-vdebug/vdebug'
Plug 'junegunn/vim-emoji'
Plug 'thinca/vim-qfreplace'
Plug 'junegunn/fzf', { 'do': { -> 'fzf#install()' }}
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'
"Plug 'skanehira/preview-markdown.vim'
" Plug 'leafgarland/typescript-vim'
Plug 'herringtondarkholme/yats.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'direnv/direnv.vim'
Plug 'Quramy/vison'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-surround'
Plug 'https://gitlab.com/lstwn/broot.vim'
Plug 'skanehira/preview-uml.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'aklt/plantuml-syntax'
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
" set spell
" set spelllang=en,cjk
set wildmenu
set wildmode=full
set hlsearch
set incsearch
set sb " split開く時に下にだす
nos
" set foldmethod=indent

" list charts
set listchars=tab:▸\ ,eol:¬

filetype plugin indent on

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" window color
autocmd ColorScheme * highlight NormalNC guifg=#a0a0a0 guibg=#121212
autocmd WinEnter,BufWinEnter * setlocal wincolor=
autocmd WinLeave * setlocal wincolor=NormalNC

"color schema
colorscheme rigel
set termguicolors

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
set clipboard+=unnamed,unnamedplus,autoselect

" cursor
set cursorline
hi CursorLine cterm=bold,underline

" tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" configure shortcuts
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>load :source $MYVIMRC<CR>

" window resize
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Fern
augroup __fern__
    au!
    autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
augroup END

nnoremap ,t :<c-u>Fern. -drawer -stay -keep -toggle -reveal=%<CR>

" Broot
" command! -nargs=? -complete=command Broot           call g:OpenBrootInPathInWindow(s:broot_default_explore_path, <f-args>)
command! -nargs=? -complete=command Broot           call g:OpenBrootInPathInWindow(g:broot_default_explore_path, <f-args>)
command! -nargs=? -complete=command BrootCurrentDir call g:OpenBrootInPathInWindow("%:p:h", <f-args>)
command! -nargs=? -complete=command BrootWorkingDir call g:OpenBrootInPathInWindow(".", <f-args>)
command! -nargs=? -complete=command BrootHomeDir    call g:OpenBrootInPathInWindow("~", <f-args>)

nnoremap <silent> <leader>e :BrootWorkingDir<CR>
nnoremap <silent> - :BrootCurrentDir<CR>

" auto completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

let g:asyncomplete_auto_popup = 1

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

" lsp settings
let g:lsp_fold_enabled = 0

let g:lsp_settings = {
 \  'clang': {
 \    'cmd': ['-lwiringPi'],
 \  },
\}

" language server protocol short cuts
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition))
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> [c <Plug>(lsp-previous-error)
nmap <silent> ]c <Plug>(lsp-next-error)
nmap <silent> E <Plug>(lsp-document-diagnostics)
nnoremap <silent> K :LspHover<CR>

" Leaderf
"let g:Lf_WorkingDirectoryMode = 'a'
"let g:Lf_PreviewInPopup = 1
"let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
"noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
"noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
"noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
"noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"noremap ff :Leaderf file --popup<CR>

noremap <leader><leader>t :tab terminal<CR>

let g:Lf_ShowDevIcons = 1
set ambiwidth=double

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'vim_lsp'
let g:vista_executive_for = {
            \ 'cpp': 'vim_lsp',
            \ 'php': 'vim_lsp',
            \ }
let g:vista_ctags_cmd = {
            \ 'haskell': 'hasktags -x -o - -c',
            \ }
let g:vista_fzf_preview = ['right:50%']
noremap <leader>vi :Vista<CR>

" open browser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" terminal setting @see https://qiita.com/Sylba2050/items/d215abc626d811f49775
" tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <Esc> <C-W>N
tnoremap <Esc><Esc> <C-W>N
tnoremap <C-v> <C-W>"+<CR>
autocmd TerminalOpen * if &buftype == 'terminal' |
            \ setlocal bufhidden=hide | setlocal scl=no | setlocal nonu |
            \ let t:send_to_term = +expand('<abuf>') |
            \ endif
" @see https://github.com/vim/vim/issues/2716 terminal arrow key active
set timeout timeoutlen=1000  " Default
set ttimeout ttimeoutlen=100  " Set by defaults.vim

" airline
let g:rigel_airline = 1
let g:airline_theme = 'rigel'
let g:airline_powerline_font = 1

" quick run
let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader><Leader>r :<C-u>QuickRun<CR>

" nerdtree
" nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" let NERDTreeShowHidden=1
" autocmd VimEnter * NERDTree 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && 
"             \ b:NERDTree.isTabTree()) | q | endif

" sonictemplate
let g:sonictemplate_vim_template_dir = [
            \ '$HOME/dotfiles/template',
            \ '$HOME/.vim/template'
            \]

" call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
" \   'name': 'nextword',
" \   'whitelist': ['*'],
" \   'args': ['-n', '10000'],
" \   'completor': function('asyncomplete#sources#nextword#completor')
" \   }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
    \ 'name': 'emoji',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#emoji#completor'),
    \ }))

" 
" sqls
if executable('sqls')
    augroup LspSqls
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'sqls',
                    \ 'cmd': {server_info->['sqls']},
                    \ 'whitelist': ['sql'],
                    \ 'workspace_config': {
                    \     'sqls': {
                    \        'driver': 'mysql',
                    \        'dataSourceName': 'root:root@tcp(127.0.0.1:11001)/authense'
                    \     },
                    \ },
                    \})
    augroup END
endif

" comand history 不要な設定は削除 @see https://qiita.com/monaqa/items/e22e6f72308652fc81e2
autocmd CmdwinEnter : g/^qa\?!\?$/d
autocmd CmdwinEnter : g/^wq\?a\?!\?$/d

" startify
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_commands = [
            \ ':help reference',
            \ ['Vim Reference', 'h ref'],
            \ {'h': 'h ref'},
            \ ]

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0

" ale
let g:ale_disable_lsp = 1
let g:ale_fixers = {
\    'php': ['php_cs_fixer'],
\    'javascript': ['prettier'],
\    'typescript': ['prettier'],
\    'javascriptreact': ['prettier'],
\    'typescriptreact': ['prettier'],
\    }
let g:ale_fix_on_save = 1
let g:ale_php_phpcs_standard = 'PSR2'

" findroom
let g:findroot_patterns = [
            \ 'package.json',
            \ '.git',
            \]

let g:vdebug_options = {
            \    'debug_file_level' : 2,
            \    'debug_file' : '~/vdebug.log',
            \}
noremap <silent>5ter :ter ++rows=5<CR>

" indent guide
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgray

let g:indent_guides_auto_colors = 0
hi IndentGuidesEven ctermbg=darkgrey

nnoremap <leader>s :Gina status<CR>
nnoremap <leader>ch <Plug>(gina-index-checkout)

" emoji
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')

" ripgrep
if executable('rg')
    let &grepprg = 'rg --vimgrep'
    set grepformat=%f:%l:%c:%m
endif

augroup AutoQuickfix
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

function! ToggleQuickFix()
    if exists("g:qwindow")
        lclose
        unlet g:qwindow
    else
        try
            lopen 10
            let g:qwindow = 1
        catch
            echo "No Erroes found!"
        endtry
    endif
endfunction

nnoremap <silent> <C-n> :<C-u>cnext<CR>
nnoremap <silent> <C-p> :<C-u>cprev<CR>
nnoremap <F2> :call ToggleQuickFix()<CR>

"" fzf
let g:fzf_mru_relative = 1
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
"
"noremap fa :FzfPreviewProjectFilesRpc <CR>
"noremap ff :FzfPreviewGitFilesRpc <CR>
"noremap fb :FzfPreviewBuffersRpc <CR>
noremap ff :GFiles <CR>
noremap fb :Buffers <CR>
noremap fa :Files <CR>

let g:preview_markdown_vertical=1
let g:preview_markdown_auto_update=1
let g:preview_markdown_parser = 'glow'


augroup fern
  autocmd!
  autocmd CursorMoved <buffer> echo matchstr(getline('.'), '[-./[:alnum:]_]\+')
augroup END

" quit all
noremap ,q :qa!<CR>

let g:terminal_ansi_colors = [
            \ '#073642',
            \ '#dc322f',
            \ '#859900',
            \ '#b58900',
            \ '#268bd2',
            \ '#d33682',
            \ '#2aa198',
            \ '#eee8d5',
            \ '#002b36',
            \ '#cb4b16',
            \ '#586e75',
            \ '#657b83',
            \ '#839496',
            \ '#6c71c4',
            \ '#93a1a1',
            \ '#fdf6e3',
            \ ]

let g:preview_uml_url='http://localhost:8888'

au FileType plantuml command! OpenUml : !wsl-open %
