vim.lsp.enable("prismals")
vim.lsp.config("prismals", {
	filetypes = { "prisma" },
	on_attach = function()
		print("prisma attached")
	end,
})
