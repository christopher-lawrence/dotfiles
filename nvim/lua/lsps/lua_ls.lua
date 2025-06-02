vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
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
