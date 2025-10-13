vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOMEPATH") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = false

vim.opt.scrolloff = 8
vim.opt.scrolljump = 5
vim.opt.signcolumn = "yes:1"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.showmode = false

-- use treesitter for code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldcolumn = "1"

-- set insert mode to a bar
vim.opt.guicursor = "i:ver25"

-- vim.g.python3_host_prog = "/Users/chris/.pyenv/versions/nvim/bin/python"

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        print("LspAttach event fired")

        -- print(string.format('event fired: %s', vim.inspect(event)))
        local opts = { buffer = event.buf, remap = false }

        -- (W)orkspace
        -- this is defined in telescope.lua
        -- vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

        -- (D)iagnostics
        -- Other diagnostics actions are defined in trouble.lua
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.get_next, opts)
        -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.get_prev, opts)


        -- definitions/references
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- code action
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- utility
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)

        -- this triggers the buffer specific formatters, which can be different that Format.nvim for some reason
        vim.keymap.set("n", "<leader>bf", ":lua vim.lsp.buf.format { async = true }<CR>")
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    -- signs = true,
    -- update_in_insert = false,
    -- underline = true,
    -- severity_sort = false,
    -- float = true,
})
