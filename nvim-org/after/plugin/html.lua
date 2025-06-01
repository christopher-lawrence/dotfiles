local lspconfig = require("lspconfig")

-- disabled for HTMLDJANGO due to the indention
lspconfig.html.setup({
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
