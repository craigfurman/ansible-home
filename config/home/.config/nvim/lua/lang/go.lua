local filetype = 'go'

local function setupLsp()
  local lspconfig = require('lspconfig')
  local configs = require 'lspconfig/configs'

  lspconfig.gopls.setup{}

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
    filetypes = {filetype}
  }
end

return {
  filetype = filetype,
  extensions = {'go'},
  setupLsp = setupLsp,
  fileOpenCmds = {'setlocal noexpandtab'},
  preSaveCmds = {'lua lsp_imports_and_format(1000)'},
}
