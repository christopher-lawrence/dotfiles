return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	config = function()
		---@type rest.Opts
		vim.g.rest_nvim = {
			---@class rest.Config.Env
			env = {
				---@type boolean
				enable = true,
				---@type string
				pattern = ".*%.env.json",
			},
		}
	end,
}
