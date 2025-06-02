vim.lsp.enable("volar")
vim.lsp.config("volar", {
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
