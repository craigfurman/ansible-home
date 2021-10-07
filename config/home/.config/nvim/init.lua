-- globals
cmd = vim.cmd
fn = vim.fn
g = vim.g
opt = vim.opt
api = vim.api

-- vim helper functions
function map(mode, lhs, rhs, opts)
  opts = opts or {noremap=true, silent=true}
  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

vmap = function(lhs, rhs, opts) map('v', lhs, rhs, opts) end
nmap = function(lhs, rhs, opts) map('n', lhs, rhs, opts) end
imap = function(lhs, rhs, opts) map('i', lhs, rhs, opts) end

-- general lua functions
function mapTable(tbl, func)
  local ret = {}
  for k, v in pairs(tbl) do
    ret[k] = func(v)
  end
  return ret
end


-- Load language-specific config
-- TODO list the files in the lang dir, and loop over that
langs = {
  go = {},
  typescript = {},
}
for name, lang in pairs(langs) do
  langs[name] = require('lang/' .. name)
end

-- Most of the code
require('plugins')
require('lsp')
require('efm')
require('config-completion')
require('treesitter')
require('file-tree')
require('config')
require('bindings')
require('appearance')

-- Configure language-specific things
for name, lang in pairs(langs) do
  lang.setupLsp()

  local extensions = table.concat(
    mapTable(lang.extensions, function(ext) return '*.' .. ext end),
    ','
  )
  for j = 1, #lang.fileOpenCmds do
    cmd(string.format('autocmd BufEnter %s %s', extensions, lang.fileOpenCmds[j]))
  end
  for j = 1, #lang.preSaveCmds do
    cmd(string.format('autocmd BufWritePre %s %s', extensions, lang.preSaveCmds[j]))
  end
end
