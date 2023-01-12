local function setupLsp()
end

return {
  filetype = 'terraform',
  extensions = {'tf'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.format({timeout_ms=2500})'},
  efmCfg = {
    {
      formatCommand = 'terraform fmt -',
      formatStdin = true
    },
  }
}
