local on_attach = function(client, bufnr)
  -- print('ruff attached')
	client.server_capabilities.hoverProvider = false
end

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      args = {},
      logFile = '~/.local/state/nvim/ruff.log',
    }
  }
}
