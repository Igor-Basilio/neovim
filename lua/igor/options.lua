
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.g.netrw_banner = 0

vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<esc>", ":noh<cr>")

