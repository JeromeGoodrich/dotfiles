call plug#begin()

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' "show git diff of edited lines

"Vim Utils
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

"JS/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

"Terraform
Plug 'hashivim/vim-terraform'

"Look n' Feel
Plug 'morhetz/gruvbox'

"Prose
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'parkr/vim-jekyll'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jparise/vim-graphql'

call plug#end()
filetype plugin indent on

let mapleader = "\<Space>"

" Look n' Feel
syntax enable
set ttyfast
set lazyredraw
set updatetime=300

" Numbers
set number
set numberwidth=4
set ruler

" Indentation
set autoindent
set cindent
set smartindent

" Folding
" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the z key
nmap z za

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile


"Fuzzy Find
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g'
nmap <c-p> :Files<cr>

"Ack
let g:ackprg = 'ag --vimgrep'
nmap <leader>t :Ack! ""<Left>
nmap <leader>T :Ack! "\b<cword>\b"<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" NerdTree
nmap <c-m> :NERDTreeFind %<cr>
nmap <c-n> :NERDTreeToggle<cr>
let g:NERDTreeWinSize=60
let g:NERDTreeShowHidden=1

"Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

"Typescript
let g:typescript_compiler_binary = 'tsc'
au BufRead,BufNewFile *.ts   setfiletype typescript

"CTRLP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|_build\|_vm_deps\|_vm_build\|dist'
let g:ctrlp_show_hidden=1


" Basics for sanity
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

"undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

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

"Redrawing
nnoremap <leader>r :redraw!<cr>

" Navigation
map j gj
map k gk
noremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Saving/Writing
:nnoremap <leader>w :w<cr>
:nnoremap <leader>q :q<cr>
:nnoremap <leader>x :x<cr>
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
set background=dark
colorscheme gruvbox

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

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> cd <Plug>(coc-definition)
nmap <silent> ct <Plug>(coc-type-definition)
nmap <silent> cl <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)

" Remap keys for applying codeAction to the current line.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()
