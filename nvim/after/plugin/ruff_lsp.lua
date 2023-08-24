-- TODO
-- local ruff = require('ruff-lsp')

require('lspconfig').ruff_lsp.setup {
  on_attach = function()
    -- print('we doin it')
  end
}

-- ruff.setup()
