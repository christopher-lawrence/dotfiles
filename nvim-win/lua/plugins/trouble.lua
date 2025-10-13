return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    cmd = "Trouble",
    -- config = function()
    -- 	require("trouble").setup({
    -- 		-- your configuration comes here
    -- 		-- or leave it empty to use the default settings
    -- 		-- refer to the configuration section below
    -- 	})
    -- end,

    ---@class trouble.Mode: trouble.Config,trouble.Section.spec
    ---@field desc? string
    ---@field sections? string[]

    ---@class trouble.Config
    ---@field mode? string
    ---@field config? fun(opts:trouble.Config)
    ---@field formatters? table<string,trouble.Formatter> custom formatters
    ---@field filters? table<string, trouble.FilterFn> custom filters
    ---@field sorters? table<string, trouble.SorterFn> custom sorters
opts = {
        focus = true,
        modes = {
            -- example of a float window
            preview_float = {
                mode = "diagnostics",
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                },
            },
            split_preview = {
                mode = "diagnostics",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
            reference_split = {
                mode = "lsp_references",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
            definition_split = {
                mode = "lsp_definitions",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.5,
                },
            },
        },
    },
    keys = {
        -- [g]o to
        {
            "<leader>gr",
            "<cmd>Trouble reference_split<cr>",
            desc = "Trouble: LSP References",
        },
        {
            "<leader>gd",
            "<cmd>Trouble definition_split<cr>",
            desc = "Trouble: LSP Definitions",
        },
        -- [b]uffer [d]iagnostics
        {
            "<leader>bd",
            "<cmd>Trouble split_preview toggle filter.buf=0<cr>",
            desc = "Trouble: Toggle Buffer Diagnostics",
        },
        -- [p]roject [d]iagnostics
        {
            "<leader>pd",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Trouble: Toggle Diagnostics",
        },
    },
}
