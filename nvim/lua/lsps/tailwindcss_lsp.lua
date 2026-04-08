-- todo

vim.lsp.enable("tailwindcss")
vim.lsp.config("tailwindcss", {
	filetypes = {
		"html",
		"css",
		"scss",
		"sass",
		"less",
		"postcss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
		"php",
		"blade",
	},
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.ts",
		"package.json",
	},
	settings = {
		tailwindCSS = {
      suggestions = true,
			-- classAttributes = { "class", "className", "ngClass", "tw", "css", "cx" },
      codeActions = true,
			lint = {
				cssConflict = "warning",
				illegalNegativeValue = "error",
				unusedConfigParameter = "warning",
				validOnly = "error",
			},
		},
	},
})
