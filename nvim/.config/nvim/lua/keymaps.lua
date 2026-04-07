-- Window navigation with Ctrl + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Lsp keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp hover" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })

-- Debugger
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Set break point" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Dap continue" })
vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Dap step over" })
vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Dap step into" })
vim.keymap.set("n", "<leader>dsr", dap.step_out, { desc = "Dap step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Dap open repl" })

-- Filetree
vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left <cr>", { desc = "Toggle file tree" })

-- Formatter
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format document" })

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fk", telescope.keymaps, { desc = "Search keymaps" })

-- Lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit <CR>", { desc = "Lazygit" })

-- Buffers
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bdelete<CR>", { desc = "Close All Buffers" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bdelete|e#<CR>", { desc = "Close Other Buffers" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List Buffers" })
vim.keymap.set("n", "<leader>be", "<cmd>ene<CR>", { desc = "New Empty Buffer" })
vim.keymap.set("n", "<leader>bx", "<cmd>bdelete!<CR>", { desc = "Force Close Buffer" })
-- =====================================================
-- WHICH-KEY GROUPS (Shows categories when you press <leader>)
-- =====================================================

local wk = require("which-key")

wk.add({
	-- Main category groups
	{ "<leader>d", group = " Debug" },
	{ "<leader>g", group = " Git" },
	{ "<leader>f", group = " Find" },
	{ "<leader>c", group = " Code" },
	{ "<leader>b", group = " Buffer" },

})

-- Optional: Add a group for Telescope find operations
wk.add({
	{ "<leader><leader>", desc = "Find files" },
})
