return {
	-- used by formatters installed with Mason
	"mhartington/formatter.nvim",
	config = function()
		--
		-- See formatter.nvim: https://github.com/mhartington/formatter.nvim
		--
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				javascript = {
					require("formatter.filetypes.javascript").prettierd,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettierd,
				},
				typescriptreact = {
					require("formatter.filetypes.typescript").prettierd,
				},
				json = {
					require("formatter.filetypes.json").prettierd,
				},
				jsonc = {
					require("formatter.filetypes.json").prettierd,
				},
				css = {
					require("formatter.filetypes.css").prettierd,
				},
				yaml = {
					-- require("formatter.filetypes.yaml").prettierd,
					function()
						return {
							exe = "prettierd",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
								"--single-quote",
							},
							stdin = true,
						}
					end,
				},
				yml = {
					require("formatter.filetypes.yaml").prettierd,
				},
				html = {
					require("formatter.filetypes.html").prettierd,
				},
				htmldjango = {
					require("formatter.filetypes.html").prettierd,
					-- Seems like a good idea, but doesn't seem to work
					-- function()
					--   print("djlint test")
					--   if vim.fn.executable("djlint") ~= 1 then
					--     print("djlint not found")
					--     return
					--   end
					--   return {
					--     exe = "djlint",
					--     args = {
					--       "--reformat",
					--       "-",
					--     }
					--   }
					-- end,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				python = {
					-- require("formatter.filetypes.python").isort,
					require("formatter.filetypes.python").ruff,
					-- function()
					-- 	return {
					-- 		exe = "python -m ruff",
					-- 		args = { "format", "-q", "-" },
					-- 		stdin = true,
					-- 	}
					-- end,
					-- defining my own function to skip string normalization (-S)
					-- function()
					--   return {
					--     exe = "black",
					--     args = {
					--       "-S", -- skip string normalization: black defaults to double quotes
					--       "-q", -- default
					--       "-", -- default
					--     },
					--     stdin = true,
					--   }
					-- end

					-- You can also define your own configuration
					-- function()
					--   print('isort setup')
					--   -- Full specification of configurations is down below and in Vim help
					--   -- files
					--   return {
					--     exe = "isort",
					--     args = {
					--       "-v",
					--       "-",
					--     },
					--     stdin = true,
					--   }
					-- end
				},
			},
		})
	end,
}
