function ColorMyPencils(color)
	-- color = color or "vscode"
	color = color or "tokyonight"
	-- color = color or "solarized"
	-- color = color or "gruvbox"
	-- color = color or "github_light"

	vim.cmd.colorscheme(color)
	vim.opt.background = "dark"
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
