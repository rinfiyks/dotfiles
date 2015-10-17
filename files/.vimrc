if has("gui_running")
	set guifont=Literation\ Mono\ Powerline
	hi Normal guifg=Black guibg=#E6E6E6
	hi Visual guifg=Black guibg=#9EC7F0
	set lines=50 columns=160
else
	set background=dark
	"do gui stuff for normal vim in here
endif

set t_Co=256

let g:airline_theme="dark"
let g:airline_powerline_fonts=1

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_ignore_files=['\.py$']

let g:pymode_python='python'
let g:pymode_lint_ignore="C901,E501,W601,W0401"
let g:pymode_doc = 0
let g:pymode_rope_complete_on_dot = 0


syntax on
hi Visual term=reverse cterm=reverse guibg=LightGrey
hi Folded ctermbg=0
hi MatchParen ctermbg=0

if has('mouse')
	"stop mouse dragging triggering visual mode
	"you can still select stuff by shift dragging
	set mouse=nicr
endif

let mapleader=" "

set noswapfile
set nocompatible

set laststatus=2

set tabstop=4
set shiftwidth=4
set autoindent

augroup FileTypes
	au!
	autocmd FileType html setlocal expandtab | setlocal tabstop=2 | setlocal shiftwidth=2
	autocmd FileType javascript setlocal expandtab | setlocal tabstop=2 | setlocal shiftwidth=2
	autocmd FileType css setlocal expandtab | setlocal tabstop=2 | setlocal shiftwidth=2
	autocmd FileType python setlocal expandtab
	autocmd FileType ruby setlocal expandtab
	autocmd FileType rust setlocal expandtab

augroup END

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
if version >= 704
	set relativenumber
endif
"if :wrap then don't break words
set linebreak
set shell=/bin/bash\ -i

set backspace=2

set cryptmethod=blowfish2

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
map <F6> <Esc>:w<CR>

"copy/paste from X clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

runtime macros/matchit.vim

filetype off "required for vundle
set rtp+=~/.vim/bundle/vundle 
call vundle#rc()

Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'gmarik/vundle'

Plugin 'rust-lang/rust.vim'

filetype plugin indent on "required for vundle
