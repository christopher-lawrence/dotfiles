return {
	-- tree parser
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the main branch does not support lazy-loading
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- parsers install to stdpath("data")/site, already on the runtimepath
		local parsers = {
			"bash",
			"c_sharp",
			"graphql",
			"javascript",
			"lua",
			"python",
			"typescript",
		}

		-- install() shells out to `tree-sitter build`, so skip it when there is no
		-- compiler rather than logging a failure for every parser on each startup
		local has_compiler = false
		for _, cc in ipairs({ "cc", "gcc", "clang", "cl" }) do
			if vim.fn.executable(cc) == 1 then
				has_compiler = true
				break
			end
		end

		if has_compiler then
			ts.install(parsers)
		end

		-- highlighting is Neovim's job on the main branch; nvim ships ftplugins that
		-- do this for markdown/lua/help/query only
		vim.api.nvim_create_autocmd("FileType", {
			desc = "start treesitter highlighting when a parser is installed",
			callback = function(event)
				pcall(vim.treesitter.start, event.buf)
			end,
		})
	end,
}
