local lspconfig = require("lspconfig")

lspconfig.prismals.setup({
	filetypes = { "prisma" },
	on_attach = function()
		print("prisma attached")
	end,
})
