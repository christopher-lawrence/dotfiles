local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
	on_attach = function()
		print("omnisharp attached")
	end,
})
