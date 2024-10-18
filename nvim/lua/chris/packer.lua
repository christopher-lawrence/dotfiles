-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope
	use({
		-- file finder/grep/etc
		{
			"nvim-telescope/telescope.nvim",
			-- explicitly setting the tag to avoid breaking changes
			tag = "0.1.8",
			-- or                          , branch = '0.1.x',
			requires = { { "nvim-lua/plenary.nvim" } },
		},
		-- fzf extension
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		-- use telescope for ui-select
		{ "nvim-telescope/telescope-ui-select.nvim" },
	})

	-- themes
	use({
		{ "arcticicestudio/nord-vim" },
		{ "folke/tokyonight.nvim" },
		{ "ellisonleao/gruvbox.nvim" },
		{ "Mofiqul/vscode.nvim" },
		{
			"maxmx03/solarized.nvim",
			config = function()
				vim.o.background = "light" -- or 'light'

				-- vim.cmd.colorscheme("solarized")
			end,
		},
		{ "projekt0n/github-nvim-theme" },
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", requires = true },
	})

	-- tree parser
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- neovim dev
	use("folke/neodev.nvim")

	-- Utilities
	use({
		-- amazing file switcher
		{ "ThePrimeagen/harpoon" },
		-- undo pane
		{ "mbbill/undotree" },
		-- git
		{ "tpope/vim-fugitive" },
		-- https://github.com/sindrets/diffview.nvim
		{ "sindrets/diffview.nvim" },
		-- smooth scrolling
		{ "psliwka/vim-smoothie" },
		-- code commentor
		{ "numToStr/Comment.nvim" },
		-- git icons in the gutter
		-- disabled in favor of gitsigns
		{ "airblade/vim-gitgutter", disable = true },
		-- git signs: testing this out. seems very nice
		-- tag = 'release' -- To use the latest release },
		{ "lewis6991/gitsigns.nvim" },
		-- vim wiki
		{ "vimwiki/vimwiki", disable = true },
		-- auto completion -- removing for now, pylsp uses jedi directly so just need that added to the pyenv
		-- { 'davidhalter/jedi-vim' },
	})

	-- lsp-zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/vim-vsnip" },
			-- not sure why these are disabled...
			{ "SirVer/ultisnips", disable = true },
			{ "quangnguyen30192/cmp-nvim-ultisnips", disable = true },
		},
	})

	-- used by formatters installed with Mason
	use({ "mhartington/formatter.nvim" })

	-- used by linters installed with Mason
	use({ "mfussenegger/nvim-lint" })

	-- Lua functions, some plugins require it
	use({ "nvim-lua/plenary.nvim" })

	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
end)
