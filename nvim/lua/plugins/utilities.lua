-- Utilities
return {
	{
		-- undo pane
		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			end,
		},
		-- https://github.com/sindrets/diffview.nvim
		{ "sindrets/diffview.nvim" },
		-- smooth scrolling
		{ "psliwka/vim-smoothie" },
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
