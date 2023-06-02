local filetype = 'go'

local function setupLsp()
  local lspconfig = require('lspconfig')
  local configs = require 'lspconfig.configs'

  goplsSettings = {}
  goplsSettings['local'] = os.getenv("GOPLS_SETTINGS_LOCAL") or ''

  -- For some repos at my work
  goplsSettings['buildFlags'] = {'-tags', 'integration,e2e'}

  lspconfig.gopls.setup{
    settings = {
      gopls = goplsSettings
    }
  }

  lspconfig.golangci_lint_ls.setup{}
end

return {
  filetype = filetype,
  extensions = {'go'},
  setupLsp = setupLsp,
  fileOpenCmds = {'setlocal noexpandtab'},
  preSaveCmds = {'lua lsp_imports_and_format(1000)'},
}
