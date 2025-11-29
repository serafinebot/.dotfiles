local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	print("ERROR: module \"lspkind\" not found")
	return
end

lspkind.init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "",
		Property = "",
		Unit = "U",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "S",
		Event = "",
		Operator = "",
		TypeParameter = "T"
	},
})

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("ERROR: module \"cmp\" not found")
	return
end

cmp.setup {
	formatting = {
		format = lspkind.cmp_format {
			menu = {
				luasnip = "[SNIP]",
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[LUA]",
				path = "[PATH]",
				latex_symbols = "[LaTeX]",
				zotex = "[ZoTeX]",
			},
		},
	},
}
