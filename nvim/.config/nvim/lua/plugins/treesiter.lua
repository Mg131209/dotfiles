return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})

		require("nvim-treesitter").install({ "lua", "rust", "typescript", "go" })

		-- nvim-treesitter-textobjects (main branch): no auto keymaps table,
		-- must wire up keymaps manually. See keymaps.lua for the actual binds.
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
			move = {
				set_jumps = true,
			},
		})
	end,
}
