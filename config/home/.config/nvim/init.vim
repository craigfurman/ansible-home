" TODO
" Organise plugin config by plugin
" gundo breaks after navigating away from file (,,)
" restore templates
" better spellfile
" tagbar
" ,. switch between test and prod code (turns out tpope/vim-rails was doing this)
" those weird true colour codes?
" multicursors?
" Ruby autoformatting - editorconfig plugin?

" Plugins
call plug#begin()
Plug 'lambdalisue/suda.vim' " While SudoWrite is broken: https://github.com/neovim/neovim/issues/8678
Plug 'mhinz/vim-signify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch' " SudoWrite and friends
Plug 'tpope/vim-sensible'

" Git
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Editing and Movement
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'bkad/CamelCaseMotion' " TODO configure motions or delete
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'jszakmeister/vim-togglecursor'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Languages
Plug 'fatih/vim-go', { 'for': 'go' } " TODO automate GoInstallBinaries
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' } " TODO does this work?
Plug 'rust-lang/rust.vim', { 'for': 'rust' } " TODO automate `cargo install rustfmt`

"" TODO messes with NERDTree and vim-tmux-navigator
" Plug 'WolfgangMehner/c-support', { 'for': 'c' }

Plug 'dense-analysis/ale'

"  Project Navigation
Plug 'scrooloose/nerdtree'
" TODO replace :Ack! with :Rg (from fzf.vim)?
Plug 'mileszs/ack.vim'
if system('uname') =~# 'Darwin'
  Plug '/usr/local/opt/fzf'
endif
Plug 'junegunn/fzf.vim'

" Colour schemes
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Completions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'wellle/tmux-complete.vim'
Plug 'sebastianmarkow/deoplete-rust' " TODO automate `cargo install racer`

" Snippets
Plug 'SirVer/ultisnips'
" TODO are these even working?
Plug 'honza/vim-snippets'

" TODO desirable? Most repos I work in don't need ctags
" Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Bindings
let g:mapleader=','
" TODO localleader?
set pastetoggle=<F6>
nnoremap <Leader>s :w<CR>
nnoremap <Space> :noh<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>! :qa!<CR>
vnoremap Y "+y

" edit and reload config file
nnoremap <Leader>e :vsplit<CR>:edit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>r :source ~/.config/nvim/init.vim<CR>

" Stay in visual mode after changing indentation
vnoremap < <gv
vnoremap > >gv

" Misc
set mouse=a
set noshowmode "airline replaces showmode
set nowrap
set number
set textwidth=80

" Ensure cursor ends up in what I percieve to be the new split
set splitright
set splitbelow

" Tabs vs Spaces
set expandtab
set shiftwidth=2
set tabstop=2

" lower case search is case insensitive, mixed/upper case search is case
" sensitive
set ignorecase
set smartcase

" auto-reload files when changed on disk
set autoread
au FocusGained,BufEnter * :checktime

" auto-save files on focus lost
" silent! to squash errors, e.g. when buffer doesn't refer to a file
au FocusLost,WinLeave * :silent! w

" Ack.vim
let g:ackprg='rg --smart-case --hidden --vimgrep --glob !.git'
nnoremap <Leader>a :Ack!<Space>

" NERDTree
nnoremap \ :NERDTreeToggle<CR>
nnoremap \| :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1 " TODO needed?

" ale
let g:ale_linters = {
  \ 'go': ['go build', 'golangci-lint'],
  \ 'yaml': ['yamllint'],
\}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'sh': ['shfmt'],
\}
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

let g:ale_go_golangci_lint_options = ''
let g:ale_go_golangci_lint_package = 1

let g:ale_sh_shfmt_options="-i 2 -ci"

" go
let g:go_fmt_command = 'goimports'
let g:go_rename_command = 'gopls'
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1

" rust
let g:rustfmt_autosave = 1

" terraform
let g:terraform_fmt_on_save=1

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

" TODO this doesn't do anything
" let g:deoplete#sources#go#gocode_binary = 'gopls'

" tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt-=preview " never open scratch window

" FileType-specific settings
au BufRead,BufNewFile *.md,*.txt setlocal spell wrap
au BufRead,BufNewFile *.yaml.gotmpl, setlocal tw=500 wrap ft=yaml
au FileType gitcommit setlocal spell
au BufRead,BufNewFile .envrc setlocal ft=sh

" fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Rg<CR>

" gundo (undo graph)
if has('python3')
  let g:gundo_prefer_python3 = 1
endif
nnoremap <Leader>u :GundoToggle<CR>

" jsonnet

" shumphrey/fugitive-gitlab.vim
let g:fugitive_gitlab_domains = ['https://ops.gitlab.net', 'https://dev.gitlab.org']

" AndrewRadev/switch.vim
nnoremap <Leader>c :Switch<CR>
" let g:switch_custom_definitions =
"   \ [
"   \   ['foo', 'bar', 'baz'],
"   \ ]

" Colours
set background=dark
colorscheme hybrid
set termguicolors
" TODO spurious? only in tmux?
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Swap and backup
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set nobackup

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-j>"
