call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'vim-scripts/VimClojure'
Plug 'elixir-lang/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'eagletmt/ghcmod-vim'
Plug 'ElmCast/elm-vim'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'

"Prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
call plug#end()

filetype detect

"Ack.vim"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_wq = 0

" VimClojure
syntax on
let vimclojure#HightlightBuiltins=1
let vimclojure#ParenRainbow=1
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.clj setlocal filetype=clojure
autocmd BufRead,BufNewFile *.hiccup setlocal filetype=clojure
autocmd FileType clojure setlocal lispwords+=describe,it,context,around,deftest,testing,with-redefs,defspec,facts,fact,defproject

"CTRLP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Basics for sanity
let mapleader = "\<Space>"

set clipboard=unnamed

set scrolloff=3
set autoindent
set showmode
set showcmd
set wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.swp,node_modules/**
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set statusline=%f%r%h%w%\{fugitive#statusline()}\%m
set number
set nobackup
set noswapfile
set nowrap

let g:netrw_banner = 0

" Search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader>n :noh<cr>
nnoremap <leader>e :e **/*
nnoremap <leader>vsp :vsp **/*
nnoremap <leader>sp :sp */**

"Redrawing
nnoremap <leader>r :redraw!<cr>

" Navigation
map <c-n> :e.<cr>
nnoremap j gj
nnoremap k gk
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Saving/Writing
:nnoremap <leader>w :w<cr>
:nnoremap <leader>q :q<cr>
au FocusLost * :wa

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Autoremove trailing spaces when saving the buffer
autocmd FileType c,cpp,clj,eruby,html,java,javascript,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" colorscheme
set t_Co=256
syntax enable
set background=light
colorscheme solarized

"Fugitive
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Git push<CR>
nnoremap <space>gpl :Git pull<CR>

"Prose
map <leader>` :Goyo <bar> :Limelight!! <bar> :TogglePencil <CR>
let g:limelight_conceal_ctermfg = 254  " Solarized Base1
let g:limelight_conceal_guifg = '#eee8d5'  " Solarized Base1
