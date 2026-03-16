return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
  config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()

      local ls = require("luasnip")
      local s = ls.snippet
      local i = ls.insert_node
      local f = ls.function_node
      local t = ls.text_node

      ls.add_snippets("markdown", {
        s("ETMS-", {
          t("- [ ] [ETMS-"),
          i(1, "12345"),
          t("](https://qtwo.atlassian.net/browse/ETMS-"),
          f(function(args)
            return args[1][1]
          end, {1}),
          t(")")
        }),
      })

  end
}
