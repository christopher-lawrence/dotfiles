-- todo
require 'lspconfig'.volar.setup {
  -- init_options = {
  --   typescript = {
  --     tsdk = 'typescript/lib/tsserverlibrary.js'
  --   },
  -- },
  on_attach = function()
    print('volar -- we doin it')
  end
}
