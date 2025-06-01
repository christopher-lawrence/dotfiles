return {
	{ "arcticicestudio/nord-vim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{
		"maxmx03/solarized.nvim",
		config = function()
			-- vim.o.background = "light" -- or 'light'

			-- vim.cmd.colorscheme("solarized")
		end,
		lasy = true,
	},
	{ "projekt0n/github-nvim-theme", lazy = true },
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight")
			vim.opt.background = "dark"
		end,
	},
}
