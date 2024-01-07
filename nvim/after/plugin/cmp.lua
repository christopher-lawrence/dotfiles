local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    -- { name = "luasnip" }, -- this is a specific snippet provider
    { name = "vsnip" },
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
})
