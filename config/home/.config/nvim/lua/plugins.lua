-- TODO some way to put plugin declarations near to their own config?

fn['plug#begin']()
local Plug = fn['plug#']

-- Newfangled
Plug 'neovim/nvim-lspconfig'
Plug 'rinx/lspsaga.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'p00f/nvim-ts-rainbow'

-- https://github.com/nvim-lua/completion-nvim/issues/399
-- Plug 'nvim-lua/completion-nvim'
Plug('rafaelsq/completion-nvim', {branch = 'changeHandlerSignature'})

Plug 'albertoCaroM/completion-tmux'
Plug 'steelsojka/completion-buffers'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' -- dependency of a few things
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim' -- telescope dependency
Plug 'nvim-telescope/telescope.nvim'

-- "Old fashioned"
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fnune/base16-vim'
Plug 'tpope/vim-fugitive' -- Git commands
Plug 'tpope/vim-rhubarb' -- Gbrowse
Plug 'mhinz/vim-signify' -- Git gutter
Plug 'cohama/lexima.vim' -- auto close pairs

fn['plug#end']()
