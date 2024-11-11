-- local lsp = require("lsp-zero")
local lsp = require("lspconfig")
local neodev = require("neodev")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
neodev.setup({})

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"omnisharp",
		"eslint",
		-- "pyright",
		-- "mypy",
		-- "pylsp",
		"html",
	},
})

-- Fix Undefined global 'vim'
lsp.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- globals = { 'vim' }
			},
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

-- https://github.com/typescript-language-server/typescript-language-server
lsp.ts_ls.setup({
	-- init_options = {
	--   tsserver = {
	--     logVerbosity = 'verbose',
	--     trace = 'verbose',
	--     logDirectory = './log',
	--   },
	-- },
	on_attach = function()
		print("ts_ls attached")
	end,
})

lsp.omnisharp.setup({
	on_attach = function()
		print("omnisharp attached")
	end,
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- see https://github.com/microsoft/pyright/blob/main/docs/settings.md
-- lsp.configure("pyright", {
-- 	filetypes = { "python" },
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				diagnosticMode = "workspace",
-- 				diagnosticSeverityOverrides = {
-- 					reportGeneralTypeIssues = "warning",
-- 					reportOptionalMemberAccess = false,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	on_attach = function()
-- 		-- print("pyright attached")
-- 	end,
-- 	-- capabilities = capabilities,
-- })

-- Make sure to install pylsp directly into the virutal environment
-- url: https://github.com/python-lsp/python-lsp-server
-- pip install "python-lsp-server[all]"
--
-- Plugins
-- mypy
-- pip install pylsp-mypy
lsp.pylsp.setup({
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
					overrides = { "--disable-error-code=import-untyped", true, "--explicit-package-bases" },
					report_progress = true,
					dmypy_status_file = "/Users/chris/.local/state/nvim/mypy.pid",
					-- strict = true,
				},
				pycodestyle = {
					enabled = false,
				},
				autopep8 = { enabled = false },
				jedi = { auto_import_modules = { "django" } },
				jedi_completion = { fuzzy = true },
				jedi_hover = { enabled = true },
				-- This seems broken atm.
				-- See: https://github.com/python-lsp/python-lsp-server/issues/503
				rope_autoimport = {
					enabled = false,
					memory = true,
					completions = { enabled = true },
					code_actions = { enabled = true },
				},
			},
		},
	},
})

-- disabled for HTMLDJANGO due to the indention
lsp.html.setup({
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

lsp.prismals.setup({
	filetypes = { "prisma" },
	on_attach = function()
		print("prisma attached")
	end,
})

lsp.emmet_language_server.setup({
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
	init_options = {
		---@type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
})

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local lsp_format_on_save = function(client, bufnr)
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--         -- vim.lsp.buf.formatting_sync()
--         vim.lsp.buf.format({ bufnr = bufnr })
--       end,
--     })
--   end
-- end

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		-- print(string.format('event fired: %s', vim.inspect(event)))
		local opts = { buffer = event.buf, remap = false }

		-- (W)orkspace
		-- this is defined in telescope.lua
		-- vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

		-- (D)ocument
		vim.keymap.set("n", "<leader>dd", function()
			require("trouble").toggle("document_diagnostics")
		end, opts)

		-- (D)iagnostics
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

		-- definitions/references
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>gr", function()
			require("trouble").toggle("lsp_references")
		end, opts)
		vim.keymap.set("n", "gr", function()
			require("trouble").toggle("lsp_references")
		end, opts)

		-- code action
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- utility
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)

		-- this triggers the buffer specific formatters, which can be different that Format.nvim for some reason
		vim.keymap.set("n", "<leader>bf", ":lua vim.lsp.buf.format { async = true }<CR>")
	end,
})

-- lsp.on_attach(function(client, bufnr)
-- Disabling format on save for now
-- lsp_format_on_save(client, bufnr)

-- lsp_onattach_keymaps(client, bufnr)
-- end)

-- lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	-- signs = true,
	-- update_in_insert = false,
	-- underline = true,
	-- severity_sort = false,
	-- float = true,
})
