" plugin vim-plugin
" check vim-plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/vim-plug'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'thinca/vim-quickrun'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'lambdalisue/gina.vim'

Plug 'SirVer/ultisnips'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-ref'

Plug 'pangloss/vim-javascript'

Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'

Plug 'tomtom/tcomment_vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prabirshrestha/vim-lsp'

" Scala Plugin
Plug 'derekwyatt/vim-scala'

" Docker
Plug 'ekalinin/dockerfile.vim'

Plug 'haya14busa/vim-open-googletranslate'
Plug 'tyru/open-browser.vim'

Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }

" List ends here. Plug ins become visible to Vim after this call.
call plug#end()

