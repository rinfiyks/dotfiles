if has("gui_running")
	".gvimrc symlinks here
	hi Normal guifg=Black guibg=#E6E6E6
	hi Visual guifg=Black guibg=#9EC7F0
	set lines=50 columns=160
else
	"do gui stuff for normal vim in here
	colorscheme peachpuff
endif

syntax on
if has('mouse')
	set mouse=a
endif

set noswapfile
set nocompatible

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

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

"arrow keys for movement (just in case)
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>

"better solution than esc to :noh (which behaved weirdly sometimes)
nnoremap <CR> :noh<CR><CR>

map Q gqi{

"copy/paste from X clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P
