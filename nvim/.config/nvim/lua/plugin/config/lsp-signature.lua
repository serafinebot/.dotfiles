local M = {}

local status, lsp_signature = pcall(require, "lsp_signature")
if not status then
	print("ERROR: module \"lsp_signature\" not found")
	return
end

local opts = {
	bind = true,
	handler_opts = {
		border = "none"
	}
}

M.setup = function()
	lsp_signature.setup(opts)
end

M.on_attach = function(client, bufnr)
	for k, v in pairs(opts) do client[k] = v end
	lsp_signature.on_attach(client, bufnr)
end

return M
