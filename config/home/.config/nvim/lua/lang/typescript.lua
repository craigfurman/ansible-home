local filetype = 'typescript'

local function setupLsp()
  require('lspconfig').tsserver.setup{
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end,
  }
end

return {
  filetype = filetype,
  extensions = {'ts', 'js'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.formatting_sync(nil, 2500)'},
  efmCfg = {
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
  treesitterParsers = {'typescript', 'javascript'}
}
