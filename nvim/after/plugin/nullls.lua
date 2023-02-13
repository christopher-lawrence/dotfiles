local M = {}

local null_ls = require('null-ls')

-- print('null-ls setup')

local formatting = null_ls.builtins.formatting

M.sources = {
  formatting.prettierd
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
M.config = {
  -- on_attach = require("lsp-zero").on_attach,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                  -- vim.lsp.buf.formatting_sync()
                  vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
  sources = M.sources
}


-- null_ls.setup({
--   debug = true,
--   sources = {
--   },
--   on_attach = function()
--     print('attached')
--   end,
-- })

function M.setup()
  null_ls.setup(M.config)
end

M.setup()
