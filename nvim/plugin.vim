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
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'thinca/vim-quickrun'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'w0rp/ale'

Plug 'lambdalisue/gina.vim'
Plug 'tobyS/pdv'

Plug 'ctrlpvim/ctrlp.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

