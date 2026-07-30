-- Debugger setup (nvim-dap + nvim-dap-ui)
--
-- To add a new language debugger:
--   1. Add its Mason package name to `ensure_installed` below (see `:MasonInstall dap-*`,
--      or https://github.com/jay-babu/mason-nvim-dap.nvim#available-debug-adapters).
--   2. Add a new entry to the `languages` table with a function that configures
--      the `dap.adapters.*` / `dap.configurations.*` for that language. Prefer a
--      dedicated `nvim-dap-*` plugin (e.g. nvim-dap-go, nvim-dap-python) when one
--      exists, since it saves you from hand writing adapter/configuration tables.
--
-- Keymaps live in lua/keymaps.lua, not here.
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Language-specific helper plugins (configured in `languages` below)
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		-- Automatically install & register debug adapters via Mason.
		-- Add the Mason package name of any new debug adapter here.
		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" },
			automatic_installation = true,
		})

		-- Auto open/close the UI when a debug session starts/stops
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- ============================================================
		-- Per-language configuration
		-- Add a new `<lang> = function() ... end` entry to register a
		-- new debugger. Each function is responsible for setting up its
		-- own `dap.adapters` / `dap.configurations` entries.
		-- ============================================================
		local languages = {
			go = function()
				require("dap-go").setup()

				-- Go programs that read from stdin (fmt.Scanln, bufio.NewReader(os.Stdin), ...)
				-- never get real input with the default "Debug" configs above: nvim-dap
				-- spawns `dlv dap` as a background job with no real terminal attached, so
				-- any read from stdin returns immediately (EOF) instead of waiting for you
				-- to type something.
				--
				-- Fix (as recommended by nvim-dap-go itself): run delve headless inside a
				-- real Neovim terminal, so the debuggee's stdin/stdout are attached to an
				-- actual tty, then have nvim-dap attach to that session remotely.
				vim.api.nvim_create_user_command("DapGoDebugStdin", function()
					local dap = require("dap")
					local port = 38697
					local dir = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":.")

					vim.cmd("botright new | resize 15")
					vim.fn.termopen(string.format(
						"dlv debug -l 127.0.0.1:%d --headless --api-version=2 --accept-multiclient %s",
						port,
						dir
					))
					vim.cmd("wincmd p") -- keep focus on the code window

					-- give delve a moment to start listening before attaching
					vim.defer_fn(function()
						dap.run({
							type = "go",
							name = "Debug (stdin support)",
							request = "attach",
							mode = "remote",
							port = port,
						})
					end, 1000)
				end, { desc = "Debug current Go package with real stdin support (delve headless + remote attach)" })
			end,
		}

		for _, setup_language in pairs(languages) do
			setup_language()
		end
	end,
}
