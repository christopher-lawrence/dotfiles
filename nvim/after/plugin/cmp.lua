local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({ details = true })

local cmp_kinds = {
	Text = "  ",
	Method = "  ",
	Function = "  ",
	Constructor = "  ",
	Field = "  ",
	Variable = "  ",
	Class = "  ",
	Interface = "  ",
	Module = "  ",
	Property = "  ",
	Unit = "  ",
	Value = "  ",
	Enum = "  ",
	Keyword = "  ",
	Snippet = "  ",
	Color = "  ",
	File = "  ",
	Reference = "  ",
	Folder = "  ",
	EnumMember = "  ",
	Constant = "  ",
	Struct = "  ",
	Event = "  ",
	Operator = "  ",
	TypeParameter = "  ",
}

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		-- { name = "luasnip" }, -- this is a specific snippet provider
		{ name = "vsnip" },
		{ name = "nvim_lsp_signature_help" },
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
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	formatting = cmp_format,
	-- formatting = {
	-- 	-- changing the order of fields so the icon is the first
	-- 	fields = { "menu", "abbr", "kind" },
	-- 	format = function(_, vim_item)
	-- 		vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
	-- 		return vim_item
	-- 	end,
	-- },
})
