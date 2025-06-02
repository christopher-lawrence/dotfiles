vim.lsp.enable("graphql")
vim.lsp.config("graphql", {
	fileExtensions = { "typescript", "typescriptreact", "python" },
	on_attach = function()
		print("graphql attached")
	end,
})
