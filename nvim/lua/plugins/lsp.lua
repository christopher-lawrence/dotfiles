-- lsp-zero
return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},

		-- Autocompletion
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/nvim-cmp" },

		-- Snippets
		{ "rafamadriz/friendly-snippets", dependencies = { "L3MON4D3/LuaSnip" }, lazy = true },
		{ "saadparwaiz1/cmp_luasnip", lazy = true },
	},
	config = function()
		-- FOLLOWUP:
		-- not sure how to use this outside this file
		-- there are packages that get installed and before the configs run
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			automatic_installation = {
				"lua_ls",
				"ts_ls",
				"omnisharp",
				"eslint",
				"html",
				"graphql",
				"prismals",
			},
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"omnisharp",
				"eslint",
				"html",
				"graphql",
				"prismals",
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				-- print(string.format('event fired: %s', vim.inspect(event)))
				local opts = { buffer = event.buf, remap = false }

				-- (W)orkspace
				-- this is defined in telescope.lua
				-- vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

				-- (D)iagnostics
				-- Other diagnostics actions are defined in trouble.lua
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

				-- definitions/references
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

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
	end,
}
