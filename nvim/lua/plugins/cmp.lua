---Modify completion item text to show a
---label with the name of the source.
---@param opts cmp-helper.CmpFormatOpts
---@return cmp.FormattingConfig
function Cmp_format(opts)
	return require("plugins.cmp-helper.cmp").format(opts)
end

local cmp_format = Cmp_format({ details = true })

return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",
	version = false,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/cmp-nvim-lua" },
	},
	event = "InsertEnter",
	opts = function()
		local cmp = require("cmp")

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

		return {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- this is a specific snippet provider
				{ name = "nvim_lsp_signature_help" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				},
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = cmp_format,
		}
	end,
}
