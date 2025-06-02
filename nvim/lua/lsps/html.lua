vim.lsp.enable("html")
vim.lsp.config("html", {
	filetypes = { "html", "htmldjango", "css" },
	settings = {
		html = {
			format = {
				indentHandlebars = true,
				templating = true, -- django templates
				indentInnerHtml = true,
			},
		},
	},
	on_attach = function()
		-- print("html attached")
	end,
})
