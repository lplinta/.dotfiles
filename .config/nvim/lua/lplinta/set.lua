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

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.guicursor = "a:blinkon100"

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
