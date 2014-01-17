if has("gui_running")
	hi Normal guifg=Black guibg=#E6E6E6
	hi Visual guifg=Black guibg=#9EC7F0
	set lines=50 columns=160
else
	"do gui stuff for normal vim in here
endif

set t_Co=256
colorscheme peachpuff
let g:airline_theme="sol"

syntax on
if has('mouse')
	"stop mouse dragging triggering visual mode
	"you can still select stuff by shift dragging
	set mouse=nicr
endif

let mapleader=" "

set noswapfile
set nocompatible

set tabstop=4
set shiftwidth=4
set autoindent
autocmd FileType python setlocal expandtab

set list
"compile vim with +multi_byte for these chars to display correctly
set listchars=tab:▸\ ,eol:·

set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set number
"if :wrap then don't break words
set linebreak
set shell=/bin/bash\ -i

set backspace=2

"lets you hide an unwritten buffer
set hidden
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <Leader>c :bp\|bd #<CR>
let g:NERDTreeWinPos = "right"
let g:airline#extensions#tabline#enabled = 1

"arrow keys for movement (just in case)
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>

nnoremap \ :noh<CR>

map Q gqi{

"copy/paste from X clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P


filetype off "required for vundle
set rtp+=~/.vim/bundle/vundle 
call vundle#rc()

Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
if (version == 703 && has("patch 538")) || version >= 704
	Bundle 'Valloric/YouCompleteMe'
endif
Bundle 'gmarik/vundle'
filetype plugin indent on "required for vundle
