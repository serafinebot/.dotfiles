local status, luasnip = pcall(require, "luasnip")
if not status then
	print("ERROR: module \"luasnip\" not found")
	return
end

luasnip.config.set_config {
	history = false,
	updateevents = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").load()
