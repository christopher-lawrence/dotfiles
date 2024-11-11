local on_attach = function(client, bufnr)
	-- print('ruff attached')
	client.server_capabilities.hoverProvider = false
end

require("lspconfig").ruff.setup({
	on_attach = on_attach,
	-- trace = "messages",
	-- init_options = {
	-- 	settings = {
	-- 		logLevel = "debug",
	-- 	},
	-- },
})
