return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		-- Snippets
		{ "rafamadriz/friendly-snippets", dependencies = { "L3MON4D3/LuaSnip" }, lazy = true },
		{ "saadparwaiz1/cmp_luasnip", lazy = true },
	},
}
