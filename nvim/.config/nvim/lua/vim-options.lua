vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
