-- TODO: setup lsp-like configuration
local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "󰘖",
			pause = "󰏤",
			play = "󰼛",
			run_last = "",
			step_back = "",
			step_into = "󰆹",
			step_out = "󰆸",
			step_over = "󰆷",
			terminate = "󰓛"
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.50
		}, {
			id = "stacks",
			size = 0.20
		}, {
			id = "breakpoints",
			size = 0.10
		}, {
			id = "watches",
			size = 0.10
		} },
		position = "left",
		size = 50
	},
	-- {
	-- 	elements = { {
	-- 		id = "repl",
	-- 		size = 0.5
	-- 	}, {
	-- 		id = "console",
	-- 		size = 0.5
	-- 	} },
	-- 	position = "bottom",
	-- 	size = 10
	-- }
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
})

require("nvim-dap-virtual-text").setup()

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.keymap.set("n", "<leader>bc", function() dap.continue() end)
vim.keymap.set("n", "<leader>bs", function() dap.step_over() end)
vim.keymap.set("n", "<leader>bi", function() dap.step_into() end)
vim.keymap.set("n", "<leader>bo", function() dap.step_out() end)
vim.keymap.set("n", "<leader>bt", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>bC", function() dap.set_breakpoint(nil, nil, vim.fn.input("Condition: ")) end)
vim.keymap.set("n", "<leader>br", function() dap.repl.open() end)
vim.keymap.set("n", "<leader>bb", function() dapui.toggle() end)

vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#dd4040", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

vim.fn.sign_define("DapBreakpoint", { text="", texthl="DapBreakpoint", linehl="DapBreakpoint", numhl="DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text="ﳁ", texthl="DapBreakpoint", linehl="DapBreakpoint", numhl="DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text="", texthl="DapBreakpoint", linehl="DapBreakpoint", numhl= "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text="", texthl="DapLogPoint", linehl="DapLogPoint", numhl= "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text="", texthl="DapStopped", linehl="DapStopped", numhl= "DapStopped" })
