" TODO
" restore templates
" better spellfile
" tagbar
" ,. switch between test and prod code (turns out tpope/vim-rails was doing this)
" those weird true colour codes?
" multicursors?

let g:mapleader=','

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
Plug 'junegunn/vim-easy-align'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Go
" TODO automate GoInstallBinaries
Plug 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1

let g:go_rename_command = 'gopls'

" We only want vim-go's tools (:GoUpdateBinaries) and syntax highlighting. We'll
" use an LSP client (ale) for everything else.
let g:go_def_mapping_enabled = 0
let g:go_gopls_enabled = 0
let g:go_fmt_autosave = 0
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_mod_fmt_autosave = 1 " Ale doesn't have a fixer for this

" TypeScript & JavaScript
Plug 'leafgarland/typescript-vim'
" TODO seemingly causes typescript files to be recognised as javascript
" Plug 'pangloss/vim-javascript'

" Assorted languages
Plug 'google/vim-jsonnet'
Plug 'hashivim/vim-terraform'
Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' } " TODO does this work?
Plug 'skanehira/preview-markdown.vim'

" Ale: linting, formatting on save, LSP
" Integrates with LSP completions via deoplete.
" Integrates with airline automatically.
" TODO fix ALERename for go
Plug 'dense-analysis/ale'
let g:ale_linters = {
  \ 'go': ['go build', 'go vet', 'golangci-lint', 'gopls'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'javascript': ['eslint', 'tsserver'],
\}
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'sh': ['shfmt'],
  \ 'go': ['goimports'],
  \ 'typescript': ['prettier'],
  \ 'javascript': ['prettier'],
\}
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✘'
let g:ale_fix_on_save = 1
let g:ale_floating_preview = 1

let g:ale_go_golangci_lint_options = ''
let g:ale_go_golangci_lint_package = 1

let g:ale_sh_shfmt_options="-i 2 -ci"

nnoremap gd :ALEGoToDefinition<CR>
nnoremap <Leader>h :ALEHover<CR>
nnoremap <Leader>d :ALEDetail<CR>

" Deoplete: autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" deoplete sources
Plug 'wellle/tmux-complete.vim'

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
let g:airline#extensions#tabline#enabled = 1

" Snippets
" TODO bring back
" Plug 'SirVer/ultisnips'
" " TODO are these even working?
" Plug 'honza/vim-snippets'

call plug#end()

" deoplete
call deoplete#custom#option('sources', {
\ '_': ['ale', 'tmux-complete'],
\})

" Bindings
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

" skanehira/preview-markdown.vim
let g:preview_markdown_parser = 'mdcat'
let g:preview_markdown_vertical = 1

" tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set completeopt=longest,menuone

" FileType-specific settings
au BufRead,BufNewFile *.md,*.txt setlocal spell wrap
au BufRead,BufNewFile *.yaml.gotmpl, setlocal tw=500 wrap ft=yaml
au FileType gitcommit setlocal spell
au BufRead,BufNewFile .envrc setlocal ft=sh

" fzf
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :Rg<CR>

" mundo (undo graph)
set undofile
set undodir=~/.vim/undo
nnoremap <Leader>u :MundoToggle<CR>

" jsonnet

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

" Swap and backup
set swapfile
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set nobackup

" UltiSnips
" TODO bring back
" let g:UltiSnipsExpandTrigger="<C-j>"
