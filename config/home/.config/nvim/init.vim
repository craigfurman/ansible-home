" TODO
" termguicolors and those weird true colour codes
" ,b shows buffers: does this come from fzf?
" vim-go works properly
" rubocop linting
" yamllint linting
" tabstop and friends
" syntax highlighting in git commit messages
" multicursors?
" undotree?
" map Ack
" continue vetting plugins from vim-limelight onwards
" ,. switch between test and prod code
" ,, last tab (fzf?)

" Plugins
" TODO auto-install vim-plug
call plug#begin()
" TODO vim-rhubarb?
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-eunuch' " SudoWrite and friends
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

" Editing and Movement
Plug 'bkad/CamelCaseMotion' " TODO configure motions or delete
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-surround'

" Languages
Plug 'WolfgangMehner/c-support'
Plug 'fatih/vim-go'
Plug 'mustache/vim-mustache-handlebars'
Plug 'w0rp/ale'

"  Project Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

" Colour schemes
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Bindings
let g:mapleader=','
" TODO localleader?
set pastetoggle=<F6>
nnoremap <CR> :w<CR>

" Misc
set mouse=a
set noshowmode "airline replaces showmode
set nowrap
set number

" Tabs vs Spaces
set expandtab
set shiftwidth=2
set tabstop=2

" lower case search is case insensitive, mixed/upper case search is case
" sensitive
set ignorecase
set smartcase

" Ack.vim
let g:ackprg='rg --vimgrep'
cabbrev Ack Ack!
cabbrev Rg Ack!
cabbrev Ag Ack!
nnoremap <Leader>a :Ack!<Space>

" NERDTree
nnoremap \ :NERDTreeToggle<CR>
nnoremap \| :NERDTreeFind<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1 " TODO needed?

" Colours
set background=dark
colorscheme hybrid
set termguicolors

" Swap and backup
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set nobackup
