local lspconfig = require('lspconfig')

print('volar loading...')

lspconfig.volar.setup({
  init_options = {
    typescript = {
      tsdk = '/Users/chris/.config/yarn/global/node_modules/typescript/lib'
    },
  },
})
