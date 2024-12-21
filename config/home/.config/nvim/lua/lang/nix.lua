local function setupLsp()
end

return {
  filetype = 'nix',
  extensions = {'nix'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.format({timeout_ms=2500})'},
  efmCfg = {
    {
      -- Works in flakes only
      formatCommand = 'nix fmt',
      formatStdin = true
    },
  }
}
