-- TODO some way to put plugin declarations near to their own config?

fn['plug#begin']()
local Plug = fn['plug#']

-- Newfangled
Plug 'neovim/nvim-lspconfig'
Plug('tami5/lspsaga.nvim', {branch = 'nvim6.0'})
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'p00f/nvim-ts-rainbow'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'andersevenrud/cmp-tmux'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

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
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify' -- Git gutter
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'

fn['plug#end']()
