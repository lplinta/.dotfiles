vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { space = '·' }

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.diagnostic.config({ virtual_text = true })

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.guicursor = vim.opt.guicursor:append('i:ver1-blinkon100')
vim.opt.guicursor = vim.opt.guicursor:append("n:block-blinkon100")
vim.opt.guicursor = vim.opt.guicursor:append("v:block-blinkon100")

vim.opt.cmdheight = 0

vim.cmd [[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
]]
