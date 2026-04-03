-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "<CapsLock>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Swithc to next open bufer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Switch to last bufer" })

-- Enable shift + arrows in insert mode to select
vim.api.nvim_set_keymap("i", "<S-Left>", "<Esc>v<Left>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Right>", "<Esc>v<Right>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Esc>v<Up>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<Esc>v<Down>a", { noremap = true, silent = true })
