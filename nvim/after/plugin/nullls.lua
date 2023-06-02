local M = {}

local null_ls = require('null-ls')

-- A function to recursively print the contents of a table, indenting each level with '--'
local function tprint (table, tabs)
  if (type(table) == 'table') then
    for key, value in pairs(table) do
      print(tabs, key, type(value))

      if (type(value) == 'table') then
        tprint(value, tabs .. '--')
      elseif (type(value) ~= "table" and type(value) ~= "function") then
        print(tabs, value)
      end
    end
  else
    print(tabs, '**not a table**')
    print(tabs, table, type(table))
  end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

M.sources = {
  formatting.prettierd,
  diagnostics.pylint.with({
    prefer_local="venv/bin",
  })
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
        print('on_attach:client')
        tprint(client, "")
    end,
  sources = M.sources
}

-- print('diagnostics.pylint')
-- tprint(diagnostics.pylint, "")

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
