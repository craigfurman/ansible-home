require("mason").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'efm',
    'elixir-ls',
    'golangci-lint-langserver',
    'gopls',
  }
}
