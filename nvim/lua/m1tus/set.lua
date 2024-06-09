vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8

-- Disable Vi compatibility mode
vim.opt.compatible = false
-- Enable filetype detection, plugin, and indent
vim.cmd('filetype plugin on')
-- Enable syntax highlighting
vim.cmd('syntax on')
