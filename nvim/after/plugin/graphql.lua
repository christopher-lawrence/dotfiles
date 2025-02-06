local lspconfig = require("lspconfig")

lspconfig.graphql.setup({
	fileExtensions = { "typescript", "typescriptreact" },
	on_attach = function()
		-- print("graphql attached")
	end,
})
