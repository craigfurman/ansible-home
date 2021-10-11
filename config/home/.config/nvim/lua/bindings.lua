nmap('<Space>', ':noh<CR>')
nmap('<Leader>s', ':w<CR>')
nmap('<Leader>!', ':qa!<CR>')
nmap('<Leader><Leader>', '<C-^>')
nmap('<Leader>q', ':bdelete<CR>')
vmap('Y', '"+y')

-- edit and reload config file
nmap('<Leader>gc', ':vsplit<CR>:edit ~/.config/nvim/init.lua<CR>')
-- TODO this doesn't do what I thought due to idempotent lua require()
nmap('<Leader>r', ':source ~/.config/nvim/init.lua<CR>')

-- Telescope
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fm', '<cmd>Telescope marks<cr>')
nmap('<leader>fo', ':Telescope ', {noremap=true}) -- find other, not silent as prompt
