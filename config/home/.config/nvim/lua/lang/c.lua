local filetype = 'c'

local function setupLsp()
  require'lspconfig'.ccls.setup{}
end

return {
  filetype = filetype,
  extensions = {'c', 'h'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua lsp_imports_and_format(1000)'},
}
