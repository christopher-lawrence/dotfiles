print('Loading rest.lua')

---@type rest.Opts
vim.g.rest_nvim = {
	---@class rest.Config.Env
	env = {
		---@type boolean
		enable = true,
		---@type string
		pattern = ".*%.env.json",
	},
}
