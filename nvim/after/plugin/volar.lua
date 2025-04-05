local lspconfig = require("lspconfig")

lspconfig.volar.setup({
  on_attach = function()
    print("Volar attached")
  end,
  -- by not specifying tsdk the local node_modules will be used
	-- init_options = {
	-- 	typescript = {
	-- 		tsdk = "/Users/chris/.config/yarn/global/node_modules/typescript/lib",
	-- 	},
	-- },
})
