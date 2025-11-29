vim.opt.termguicolors = true -- ensure termguicolors is enabled

local status, nvim_colorizer = pcall(require, "colorizer")
if not status then
	print("ERROR: module \"nvim-colorizer\" not found")
	return
end

nvim_colorizer.setup({
	'*'; -- Highlight all files, but customize some others.
	'!vim'; -- Exclude vim from highlighting.
})
