function lsp_imports(timeout_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit)
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

function lsp_imports_and_format(timeout_ms)
  timeout_ms = timeous_ms or 1000
  lsp_imports(timeout_ms)
  vim.lsp.buf.formatting_sync(nil, timeout_ms)
end

-- keymaps: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nmap('K', '<cmd>Lspsaga hover_doc<CR>')
nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
imap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
nmap('<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
nmap('<Leader>ca', '<cmd>Lspsaga code_action<CR>')
nmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
nmap('[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
nmap(']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
nmap('<Leader>e', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
