set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

call plug#end()

source ~/.vimrc
