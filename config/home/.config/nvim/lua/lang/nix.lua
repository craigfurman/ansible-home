local function setupLsp()
  require('lspconfig').nil_ls.setup {
    settings = {
      ['nil'] = {
        formatting = {
          -- Credit to https://github.com/oxalica/nil/issues/70#issuecomment-2287139772
          -- That thread has some ideas for making this less slow too. I think
          -- I'll try to just switch to nixfmt once I actually have home-manager
          -- up and running and can rely on my neovim always having nix packages
          -- available.
          command = {"nix", "fmt", "--", "-"},
        },
      },
    },
  }
end

return {
  filetype = 'nix',
  extensions = {'nix'},
  setupLsp = setupLsp,
  fileOpenCmds = {},
  preSaveCmds = {'lua vim.lsp.buf.format({timeout_ms=5000})'},
}
