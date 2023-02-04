-- set vim option
vim.opt.number = true
vim.opt.list = true
vim.opt.listchars:append({space = '_', eol = '↵' })
vim.opt.showtabline = 2
vim.opt.autowrite = true
vim.opt.autoread = true

vim.go.cmdheight = 2
vim.go.signcolumn = yes

vim.opt.tabstop = 4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.wildmenu = true
vim.opt.wildmode:append({ list = true, full= true})

-- set keymap
vim.g.leader = ' ' -- leader key <Space>
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('n', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true }) -- 表示行 上
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true }) -- 表示行 下

-- invalid key map
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', {noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', {noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', {noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', {noremap = true })
vim.api.nvim_set_keymap('n', 'ZZ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZQ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', { noremap = true })

-- resize TODO
