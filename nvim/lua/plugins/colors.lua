return {
	{ "arcticicestudio/nord-vim" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "Mofiqul/vscode.nvim" },
	{
		"maxmx03/solarized.nvim",
		config = function()
			-- vim.o.background = "light" -- or 'light'

			-- vim.cmd.colorscheme("solarized")
		end,
	},
	{ "projekt0n/github-nvim-theme" },
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight")
			vim.opt.background = "dark"
		end,
	},
}
