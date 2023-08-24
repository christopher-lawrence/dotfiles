local cmp = require('cmp')

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'luasnip' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }
}
