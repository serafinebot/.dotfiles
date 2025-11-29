local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("ERROR: module \"mason\" not found")
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("ERROR: module \"mason-lspconfig\" not found")
	return
end

local mason_dap_status, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_status then
	print("ERROR: module \"mason-nvim-dap\" not found")
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"jedi_language_server",
		"efm",
		"html",
		"cssls",
		"ts_ls",
		-- install manually:
		-- mypy
		-- ruff
	},
	automatic_installation = true,
})
mason_dap.setup({
	ensure_installed = {
		"python"
	},
	automatic_installation = true,
	handlers = {
		function(config)
			-- all sources with no handler get passed here
			require("mason-nvim-dap").default_setup(config)
		end,
		python = function(config)
			config.adapters = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
				args = {},
			}
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})
