local root_dir = require("lspconfig.util").root_pattern(".clang-format", ".git", ".uncrustify.cfg")();
if root_dir == nil then root_dir = "."; end

return {
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--background-index",
		"--pch-storage=disk",
		"--log=info",
		"--completion-style=detailed",
		"--enable-config",   -- clangd 11+ supports reading from .clangd configuration file
		"--clang-tidy",
		"--offset-encoding=utf-8",
		-- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
		-- "--fallback-style=Google",
		-- "--header-insertion=never",
		-- "--query-driver=<list-of-white-listed-complers>"
	},
	root_dir = root_dir,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	filetypes = { "c", "cpp", "objc", "objcpp", "h" },
	on_attach = function(_, bufnr)
		local uncrustify = require("uncrustify")

		local cfg_paths = { root_dir .. "/.uncrustify.cfg", root_dir .. "/uncrustify.cfg", vim.env.HOME .. "/.config/uncrustify/uncrustify.cfg" }
		local cfg_path = nil;
		for _, path in pairs(cfg_paths) do
			if vim.fn.filereadable(path) == 1 then
				cfg_path = path;
				break;
			end
		end
		
		uncrustify.setup({
			uncrustify_bin_path = "uncrustify",
			uncrustify_cfg_path = cfg_path,
			filetype_mapping = { c = "c", cpp = "cpp" },
			format_timeout = 5000
		})

		vim.keymap.set({ "n", "v" }, "<leader>FF", uncrustify.format, { noremap = true, silent = true, buffer = bufnr })
	end
}
