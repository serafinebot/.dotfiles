local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module \"lspconfig\" not found")
	return
end

local lspmanager = require("plugin.config.lsp.manager")

-- TODO: delete debug enable
-- vim.lsp.set_log_level('debug')

vim.diagnostic.config({
	virtual_text = {
		-- prefix = "●", -- Optional prefix for the virtual text
		source = "always", -- Show diagnostic source
	},
	severity_sort = true, -- Sort diagnostics by severity
})

lspmanager.setup(lspconfig, "efm")
lspmanager.setup(lspconfig, "lua_ls")
lspmanager.setup(lspconfig, "jedi_language_server")
lspmanager.setup(lspconfig, "clangd")
lspmanager.setup(lspconfig, "m68k")
lspmanager.setup(lspconfig, "html")
lspmanager.setup(lspconfig, "cssls")
lspmanager.setup(lspconfig, "ts_ls")
lspmanager.setup(lspconfig, "beancount")
