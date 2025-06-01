local cmp = require("cmp")
local cmp_format = require("lsp-zero").cmp_format({ details = true })
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
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
})

-- TODO: Add more filetype specific configs
-- this doesn't currently work
cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "nvim-dadbod-completion" },
		{ name = "buffer" },
	},
})
