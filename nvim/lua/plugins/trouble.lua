return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	cmd = "Trouble",
	-- config = function()
	-- 	require("trouble").setup({
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	})
	-- end,
	opts = {
		focus = true,
	},
  keys = {
    {
      "<leader>gr",
      "<cmd>Trouble lsp_references<cr>",
      desc = "Trouble: LSP References",
    },
    {
      "<leader>dd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble: Toggle Buffer Diagnostics",
    },
    {
      "<leader>D",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble: Toggle Diagnostics",
    }
  },
}
