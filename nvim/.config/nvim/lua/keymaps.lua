local map = vim.keymap.set -- Alias for easier keymap setting

-- General keymaps
map("n", ",", "@@", { desc = "Repeat last macro" })                     -- Press , to repeat the last macro
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })   -- Ctrl + s to save in normal, insert, and visual modes
map("n", "<leader>ww", ":set wrap!<CR>", { desc = "Toggle line wrap" }) -- Toggle line wrapping
map({"v", "n"}, "<leader>p", "\"_dP", { desc = "Paste without overwriting register" }) -- Paste in visual mode without overwriting the default register

-- Makros
map("v", "<leader>-", "c~~pa~~", {desc = "Put a line trhu text in markdown"})
map("n", "<leader>a", "ggVG" , {desc = "Select all"}) -- Select all text

-- Window navigation is handled by vim-tmux-navigator on <C-h/j/k/l>

-- Lsp keymaps
map("n", "K", require("spell").suggest, { desc = "Hover / Spell suggest" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
map("n", "rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
-- diagnostics
map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>dm", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
end, { desc = "List diagnostics in file" })

-- Filetree
map("n", "<leader>e", ":Neotree filesystem toggle left <cr>", { desc = "Toggle file tree" })

-- Formatter
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format document" })

-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader><leader>", telescope.find_files, { desc = "Find files" })
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fa", function()
  telescope.find_files({ hidden = true, no_ignore = true })
end, { desc = "Find all files (hidden + gitignored)" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Live grep" })
map("n", "<leader>fk", telescope.keymaps, { desc = "Search keymaps" })

-- Lazygit
map("n", "<leader>gg", ":LazyGit <CR>", { desc = "Lazygit" })

-- Buffers
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
map("n", "<leader>bD", "<cmd>%bdelete<CR>", { desc = "Close All Buffers" })
map("n", "<leader>bo", "<cmd>%bdelete|e#<CR>", { desc = "Close Other Buffers" })
map("n", "<leader>be", "<cmd>ene<CR>", { desc = "New Empty Buffer" })
map("n", "<leader>bx", "<cmd>bdelete!<CR>", { desc = "Force Close Buffer" })
map("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List Buffers" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
map("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- =====================================================
-- WHICH-KEY GROUPS (Shows categories when you press <leader>)
-- =====================================================

local wk = require("which-key")

wk.add({
  -- Main category groups
  { "<leader>d", group = " Diagnostics" },
  { "<leader>g", group = " Git" },
  { "<leader>f", group = " Find" },
  { "<leader>c", group = " Code" },
  { "<leader>b", group = " Buffer" },
  { "<leader>t", group = " Terminal" },
})

-- Optional: Add a group for Telescope find operations
wk.add({
  { "<leader><leader>", desc = "Find files" },
})
