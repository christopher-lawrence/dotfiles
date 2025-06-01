local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			codeLens = {
				enabled = true,
			},
			hint = {
				enable = true,
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				checkThirdParty = false, -- disable a pop up asking to "update workspace for 'luv'"
			},
		},
	},
})
