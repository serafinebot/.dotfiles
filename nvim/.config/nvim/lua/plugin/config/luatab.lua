local status, luatab = pcall(require, "luatab")
if not status then
	print("ERROR: module \"luatab\" not found")
	return
end

luatab.setup({})
