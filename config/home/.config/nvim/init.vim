" TODO
" ,b shows buffers
" fly colorscheme

" Plugins
" TODO auto-install vim-plug
call plug#begin()
Plug 'tpope/vim-sensible'
" TODO vim-rhubarb?
Plug 'tpope/vim-fugitive'

" Editing and Movement
" TODO configure motions
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'mustache/vim-mustache-handlebars'

" Languages
Plug 'WolfgangMehner/c-support'

"  Project Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" NERDTree
nnoremap \ :NERDTreeToggle<CR>
nnoremap \| :NERDTreeFind<CR>
