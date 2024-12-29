require("mason").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'efm',
    'elixir-ls',
    'nil',
    'golangci-lint-langserver',
    'gopls',
    'python-lsp-server',
    'rust-analyzer',
  }
}
