local lspconfig = require("lspconfig")

lspconfig.volar.setup({
	init_options = {
		typescript = {
			tsdk = "/Users/chris/.config/yarn/global/node_modules/typescript/lib",
		},
	},
})
