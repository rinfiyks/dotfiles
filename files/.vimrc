"gvimrc symlinks here, so do gvim stuff here too
if has("gui_running")
	hi Normal guifg=Black guibg=#E6E6E6
	hi Visual guifg=Black guibg=#9EC7F0
	set lines=50 columns=160
else
	"do gui stuff for normal vim in here light background/colour schemes
	colorscheme peachpuff
endif

syntax on

set noswapfile
set nocompatible
set encoding=utf-8

set tabstop=4
set shiftwidth=4
set autoindent

set showcmd
set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set number
"if :wrap then don't break words
set lbr
set mouse=a
set shell=/bin/bash\ -i

set backspace=2

"arrow keys for movement (just in case)
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>

"better solution than esc to :noh (which behaved weirdly sometimes)
nnoremap <CR> :noh<CR><CR>

"copy/paste from X clipboard
map <Leader>y "+y
map <Leader>p "+p
map <Leader>P "+P
