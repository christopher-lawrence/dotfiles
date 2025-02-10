local lspconfig = require("lspconfig")

-- Make sure to install pylsp directly into the virutal environment
-- url: https://github.com/python-lsp/python-lsp-server
-- pip install "python-lsp-server[all]"
--
-- Plugins
-- mypy: pip install pylsp-mypy
-- ruff: pip install python-lsp-ruff
lspconfig.pylsp.setup({
	filetypes = { "python" },
	-- on_attach = function()
	-- 	print("pylsp here")
	-- end,
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy = {
					enabled = true,
					dmypy = true,
					live_mode = false,
					overrides = {
						"--disable-error-code=import-untyped",
						"--explicit-package-bases",
						"--check-untyped-defs",
						"--ignore-missing-imports",
						true,
					},
					report_progress = true,
					dmypy_status_file = "/Users/chris/.local/state/nvim/mypy.pid",
					-- follow_imports = "normal",
					-- strict = true,
				},
				pycodestyle = {
					enabled = false,
				},
				autopep8 = { enabled = false },
				jedi = { auto_import_modules = { "django" } },
				jedi_completion = { enabled = true, fuzzy = true },
				jedi_hover = { enabled = true },
				-- This seems broken atm.
				-- See: https://github.com/python-lsp/python-lsp-server/issues/503
				rope_autoimport = {
					enabled = true,
					memory = true,
					completions = { enabled = true },
					code_actions = { enabled = true },
				},
			},
			ruff = {
				enabled = true,
				formatEnabled = true,
			},
		},
	},
})
