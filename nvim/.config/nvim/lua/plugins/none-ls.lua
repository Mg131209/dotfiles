return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Ensure Mason-installed binaries (e.g. eslint_d) are on PATH
		vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

		-- NOTE: null-ls iterates `sources` with `ipairs`, which stops at the
		-- first `nil`. `null_ls.builtins.formatting.rustfmt` resolves to `nil`
		-- when the `rustfmt` binary isn't installed, which silently dropped
		-- every source listed after it (including both eslint_d sources).
		-- table.insert-ing only non-nil values avoids ever creating a hole,
		-- regardless of which formatters/binaries are installed.
		local sources = {}
		local function add_source(source)
			if source ~= nil then
				table.insert(sources, source)
			end
		end

		add_source(null_ls.builtins.formatting.stylua)
		add_source(null_ls.builtins.formatting.prettier)
		add_source(null_ls.builtins.formatting.rustfmt)
		add_source(require("none-ls.diagnostics.eslint_d"))
		add_source(require("none-ls.formatting.eslint_d"))
		add_source(require("none-ls.code_actions.eslint_d"))

		null_ls.setup({
			sources = sources,
		})
	end,
}
