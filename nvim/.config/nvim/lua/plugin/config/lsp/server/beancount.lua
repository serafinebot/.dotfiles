return {
	-- init_options = {
	-- 	journal_file = "<path to your journal file>", -- Replace with your Beancount journal file path
	-- },
	cmd = { "beancount-language-server" },
	filetypes = { "beancount" },
	root_dir = function(fname)
		return require("lspconfig.util").find_git_ancestor(fname) or require("lspconfig.util").path.dirname(fname)
	end
}
