" TODO
" termguicolors!
" ,b shows buffers
" vim-go works properly
" rubocop linting
" yamllint linting
" tabstop and friends
" multicursors?
" undotree?
" map Ack
" continue vetting plugins from vim-limelight onwards
" less hideous airline colorscheme

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
" TODO vim-airline-themes?
Plug 'vim-airline/vim-airline'
call plug#end()

" NERDTree
nnoremap \ :NERDTreeToggle<CR>
nnoremap \| :NERDTreeFind<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
" TODO needed?
let g:airline#extensions#ale#enabled = 1

" Colours
set background=dark
colorscheme hybrid
