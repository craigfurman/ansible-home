-- TODO rainbow delimiters for treesitter

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local api = vim.api

-- keymap functions
function map(mode, lhs, rhs, opts)
  opts = opts or {noremap=true, silent=true}
  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local vmap = function(lhs, rhs, opts) map('v', lhs, rhs, opts) end
local nmap = function(lhs, rhs, opts) map('n', lhs, rhs, opts) end
local imap = function(lhs, rhs, opts) map('i', lhs, rhs, opts) end

g.mapleader = ','

fn['plug#begin']()
local Plug = fn['plug#']

-- Newfangled
Plug 'neovim/nvim-lspconfig'
Plug 'rinx/lspsaga.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-lua/completion-nvim'
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

-- lsp
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

lspconfig.gopls.setup{}

-- completion
opt.completeopt = 'menuone,noinsert,noselect'
opt.shortmess = opt.shortmess + 'c'
g.completion_matching_smart_case = 1
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
g.completion_sorting = 'length'
g.completion_auto_change_source = 1
imap('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr=true, noremap=true})
imap('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr=true, noremap=true})
cmd("autocmd BufEnter * lua require'completion'.on_attach()")

-- TODO path completion
g.completion_chain_complete_list = {
  default = {
    {complete_items = {'lsp'}},
    {complete_items = {'snippet', 'buffers', 'tmux'}},
    {mode = '<c-p>'},
    {mode = '<c-n>'}
  },
  TelescopePrompt = {},
}

-- langserver configs
-- TODO lsp_signature
if not lspconfig.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--out-format", "json" };
			}
		};
	}
end
lspconfig.golangcilsp.setup {
	filetypes = {'go'}
}

require'lspconfig'.tsserver.setup{
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
  end,
}

function lsp_imports(timeout_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

function lsp_imports_and_format(timeout_ms)
  timeout_ms = timeous_ms or 1000
  lsp_imports(timeout_ms)
  vim.lsp.buf.formatting_sync(nil, timeout_ms)
end

require'lspconfig'.efm.setup{
  filetypes = {'typescript'},

  cmd = {'efm-langserver'},
  -- Enable this for debugging
  -- cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},

  rootdir = vim.loop.cwd,
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {
        {
          formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
          rootMarkers = {'package.json'},
          formatStdin = true
        },
        {
          lintCommand = "./node_modules/.bin/eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
          rootMarkers = {'package.json'},
          lintIgnoreExitCode = true,
          lintStdin = true,
          lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
        },
      },
    },
  },
}

-- lsp keymaps: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('K', '<cmd>Lspsaga hover_doc<CR>')
nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
imap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nmap('<Leader>ca', '<cmd>Lspsaga code_action<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
nmap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
nmap('<Leader>e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

-- golang

cmd('autocmd BufEnter *.go setlocal noexpandtab')

-- TODO slow
cmd('autocmd BufWritePre *.go lua lsp_imports_and_format(1000)')
cmd('autocmd BufWritePre *.ts,*.js lua vim.lsp.buf.formatting_sync(nil, 2500)')

-- treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  -- indent = {
  --   enable = false,
  --   disable = {},
  -- },
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "go",
    "gomod",
    "hcl",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "ruby",
    "rust",
    "typescript",
    "vim",
    "yaml",
  },
}

-- Telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')

-- File tree
require'nvim-tree'.setup({
  disable_netrw = false,
})
nmap('\\', '<cmd>NvimTreeToggle<CR>')
nmap('|', '<cmd>NvimTreeFindFile<CR>')

-- key bindings
nmap('<Space>', ':noh<CR>')
nmap('<Leader>s', ':w<CR>')
nmap('<Leader>!', ':qa!<CR>')
nmap('<Leader><Leader>', '<C-^>')
nmap('<Leader>q', ':bdelete<CR>')

-- edit and reload config file
nmap('<Leader>gc', ':vsplit<CR>:edit ~/.config/nvim/init.lua<CR>')
nmap('<Leader>r', ':source ~/.config/nvim/init.lua<CR>')

-- Options
opt.lazyredraw = true
opt.mouse = 'a'
opt.wrap = false
opt.number = true
opt.textwidth = 80
opt.showmode = false -- lualine shows mode
opt.scrolloff = 1
opt.sidescrolloff = 5
opt.pastetoggle = '<F6>' -- TODO doesn't show up. Lualine issue?

-- Tabs vs Spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- lower case search is case insensitive, mixed/upper case search is case
-- sensitive
opt.ignorecase = true
opt.smartcase = true

-- Ensure cursor ends up in what I percieve to be the new split
opt.splitright = true
opt.splitbelow = true

-- Stay in visual mode after changing indentation
vmap('<', '<gv')
vmap('>', '>gv')

--- Save on focus lost
cmd('autocmd BufLeave,FocusLost * silent! w')

-- colorscheme
opt.termguicolors = true
cmd([[
let base16colorspace=256
source ~/.vimrc_background
]])

-- https://github.com/hoob3rt/lualine.nvim
-- TODO customize
-- TODO get icons working
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
