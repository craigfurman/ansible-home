local filetype = 'rust'

local function setupLsp()
  require'lspconfig'.rust_analyzer.setup{}
end

return {
  filetype = filetype,
  extensions = {'rs'},
  setupLsp = setupLsp,

  -- Treesitter sets tabstop=4, so we don't have to do that here.
  fileOpenCmds = {},

  preSaveCmds = {'lua lsp_imports_and_format(1000)'},
}
