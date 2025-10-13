return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	cmd = "Trouble",
	-- config = function()
	-- 	require("trouble").setup({
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	})
	-- end,

	---@class trouble.Mode: trouble.Config,trouble.Section.spec
	---@field desc? string
	---@field sections? string[]

	---@class trouble.Config
	---@field mode? string
	---@field config? fun(opts:trouble.Config)
	---@field formatters? table<string,trouble.Formatter> custom formatters
	---@field filters? table<string, trouble.FilterFn> custom filters
	---@field sorters? table<string, trouble.SorterFn> custom sorters
	opts = {
		focus = true,
		modes = {
			split_references = {
				mode = "lsp_references",
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.5,
				},
			},
		},
	},
	keys = {
    -- [g]o to [r]eferences
		{
			"<leader>gr",
			"<cmd>Trouble split_references<cr>",
			desc = "Trouble: LSP References",
		},
    -- [g]o to [d]efinition
		{
			"<leader>gd",
			"<cmd>Trouble lsp_definitions<cr>",
			desc = "Trouble: LSP Definitions",
		},
    -- [b]uffer [d]iagnostics
		{
			"<leader>bd",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Trouble: Toggle Buffer Diagnostics",
		},
    -- [p]roject [d]iagnostics
		{
			"<leader>pd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Trouble: Toggle Diagnostics",
		},
	},
}
