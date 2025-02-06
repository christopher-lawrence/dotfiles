return {
	-- used by linters installed with Mason
	"mfussenegger/nvim-lint",
  lazy = true,
	config = function()
		-- Not sure if this is necessary any more??
		require("lint").linters_by_ft = {
			-- Should mypy be the linter??
			-- python = {'mypy',},
			-- json = {'eslint',}
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
