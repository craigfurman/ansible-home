local filetype = 'elixir'

local function setupLsp()
  require'lspconfig'.elixirls.setup{
    cmd = {vim.fn.stdpath('data')..'/mason/bin/elixir-ls'},
  }
end

return {
  filetype = filetype,
  extensions = {'ex', 'exs'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.format({})'},
}
