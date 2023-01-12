local filetype = 'typescript'

local function setupLsp()
  require('lspconfig').tsserver.setup({})
end

return {
  filetype = filetype,
  extensions = {'ts', 'js'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.format({client="efm", timeous_ms=2500})'},
  efmCfg = {
    {
      formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
      rootMarkers = {'package.json'},
      formatStdin = true
    },
    {
      lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
      rootMarkers = {'package.json'},
      lintIgnoreExitCode = true,
      lintStdin = true,
      lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
    },
  },
  treesitterParsers = {'typescript', 'javascript'}
}
