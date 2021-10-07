opt.completeopt = 'menuone,noinsert,noselect'
opt.shortmess = opt.shortmess + 'c'
g.completion_matching_smart_case = 1
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
g.completion_sorting = 'length'
g.completion_auto_change_source = 1
imap('<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr=true, noremap=true})
imap('<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr=true, noremap=true})
cmd("autocmd BufEnter * lua require'completion'.on_attach()")

-- TODO path completion
g.completion_chain_complete_list = {
  default = {
    {complete_items = {'lsp'}},
    {complete_items = {'snippet', 'buffers', 'tmux'}},
    {mode = '<c-p>'},
    {mode = '<c-n>'}
  },
  TelescopePrompt = {},
}
