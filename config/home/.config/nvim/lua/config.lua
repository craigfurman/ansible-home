-- Options
opt.lazyredraw = true
opt.mouse = 'a'
opt.wrap = false
opt.number = true
opt.textwidth = 80
opt.showmode = false -- lualine shows mode
opt.scrolloff = 1
opt.sidescrolloff = 5
opt.pastetoggle = '<F6>' -- TODO doesn't show up. Lualine issue?

-- Tabs vs Spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- lower case search is case insensitive, mixed/upper case search is case
-- sensitive
opt.ignorecase = true
opt.smartcase = true

-- Ensure cursor ends up in what I percieve to be the new split
opt.splitright = true
opt.splitbelow = true

-- Stay in visual mode after changing indentation
vmap('<', '<gv')
vmap('>', '>gv')

--- Save on focus lost
cmd('autocmd BufLeave,FocusLost * silent! update')
