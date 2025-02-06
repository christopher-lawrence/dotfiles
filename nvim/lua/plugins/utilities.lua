return {

	-- neovim dev
	-- { "folke/neodev.nvim" },

	-- Utilities
	{
		-- undo pane
		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			end,
      lazy = true,
		},
		-- https://github.com/sindrets/diffview.nvim
		{ "sindrets/diffview.nvim", lazy = true },
		-- smooth scrolling
		{ "psliwka/vim-smoothie", lazy = true },
		-- git icons in the gutter
		-- disabled in favor of gitsigns
		{ "airblade/vim-gitgutter", enabled = false },
		-- vim wiki
		{ "vimwiki/vimwiki", enabled = false },
		-- auto completion -- removing for now, pylsp uses jedi directly so just need that added to the pyenv
		-- { 'davidhalter/jedi-vim' },
		{ "github/copilot.vim" },
	},
	-- Lua functions, some plugins require it
	{ "nvim-lua/plenary.nvim" },
}
