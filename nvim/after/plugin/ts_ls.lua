local lspconfig = require("lspconfig")

-- https://github.com/typescript-language-server/typescript-language-server
lspconfig.ts_ls.setup({
	-- init_options = {
	--   tsserver = {
	--     logVerbosity = 'verbose',
	--     trace = 'verbose',
	--     logDirectory = './log',
	--   },
	-- },
	on_attach = function()
		-- print("ts_ls attached")
	end,
})
