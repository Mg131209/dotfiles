return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup()

		local function to_hex(color)
			if not color then
				return "NONE"
			end
			return string.format("#%06x", color)
		end

		local function sync_bufferline_bg()
			local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
			local bg = to_hex(normal.bg)
			local groups = vim.fn.getcompletion("BufferLine", "highlight")
			table.insert(groups, "TabLine")
			table.insert(groups, "TabLineFill")
			table.insert(groups, "TabLineSel")

			for _, group in ipairs(groups) do
				local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
				if ok and next(hl) ~= nil then
					hl.default = nil
					hl.bg = bg
					vim.api.nvim_set_hl(0, group, hl)
				end
			end
		end

		local augroup = vim.api.nvim_create_augroup("BufferlineThemeSync", { clear = true })
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = augroup,
			callback = sync_bufferline_bg,
		})
		vim.api.nvim_create_autocmd("UIEnter", {
			group = augroup,
			once = true,
			callback = sync_bufferline_bg,
		})

		sync_bufferline_bg()
	end,
}
