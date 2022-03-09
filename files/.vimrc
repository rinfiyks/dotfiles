set encoding=utf-8
scriptencoding utf-8

if has("gui_running")
  hi Normal guifg=Black guibg=#E6E6E6
  hi Visual guifg=Black guibg=#9EC7F0
  set lines=50 columns=160
else
  set background=dark
  "do gui stuff for normal vim in here
endif

set t_Co=256

let g:airline_theme="wombat"
let g:airline_powerline_fonts=1

let g:ctrlp_working_path_mode = 'a'

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map={ 'passive_filetypes': ['java', 'scala'] }

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_dirhistmax = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

set fillchars+=vert:│
highlight VertSplit cterm=NONE ctermfg=Black ctermbg=Blue

syntax on
hi Visual term=reverse cterm=reverse guibg=LightGrey

if has('mouse')
  "stop mouse dragging triggering visual mode
  "you can still select stuff by shift dragging
  set mouse=nicr
endif

let mapleader=" "

set nobackup
set nowritebackup
set noswapfile
set noundofile
set nocompatible

set laststatus=2

set tabstop=2
set shiftwidth=2
set autoindent
set expandtab

" expandtab will convert tabs to spaces when you press tab
" the default is 4 spaces, overridden below:
augroup FileTypes
  au!
  autocmd FileType java setlocal tabstop=4 | setlocal shiftwidth=4
  autocmd FileType go setlocal expandtab!
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

set notimeout
set ttimeout
set timeoutlen=100

"lets you hide an unwritten buffer
set hidden
map <C-K> :bprev<CR>
map <C-J> :bnext<CR>
map <F5> :bprev<CR>
map <F6> :bnext<CR>
map <Leader>c :bp\|bd #<CR>
let g:airline#extensions#tabline#enabled = 1

"arrow keys for movement (just in case)
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>

nnoremap <silent> \ :noh<CR>

"copy/paste from X clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

if !empty(glob("$HOME/.vimrc_local"))
  source $HOME/.vimrc_local
endif

runtime macros/matchit.vim

filetype off "required for vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

filetype plugin indent on "required for vundle
