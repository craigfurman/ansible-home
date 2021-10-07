require'nvim-tree'.setup({
  disable_netrw = false,
})
nmap('\\', '<cmd>NvimTreeToggle<CR>')
nmap('|', '<cmd>NvimTreeFindFile<CR>')
