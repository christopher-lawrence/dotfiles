-- local mason_registry = require("mason-registry")
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
-- 	.. "/node_modules/@vue/language-server"

-- https://github.com/typescript-language-server/typescript-language-server
vim.lsp.enable("ts_ls")
vim.lsp.config("ts_ls", {
	-- init_options = {
	--   tsserver = {
	--     logVerbosity = 'verbose',
	--     trace = 'verbose',
	--     logDirectory = './log',
	--   },
	-- },
	init_options = {
		-- Make sure to install @vue/typescript-plugin locally
		-- plugins = {
		-- 	{
		-- 		name = "@vue/typescript-plugin",
		-- 		location = vue_language_server_path,
		-- 		languages = { "vue" },
		-- 	},
		-- },
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	on_attach = function()
		-- print("ts_ls attached")
	end,
})
