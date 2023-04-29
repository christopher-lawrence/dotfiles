local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            codeLens = {
              enabled = true
            },
            hint = {
              enable = true
            }
        }
    }
})

-- vim.lsp.handlers["textDocument/codeAction"] = 

-- https://github.com/typescript-language-server/typescript-language-server
lsp.configure('tsserver', {
  -- init_options = {
  --   tsserver = {
  --     logVerbosity = 'verbose',
  --     trace = 'verbose',
  --     logDirectory = './log',
  --   },
  -- },
  on_attach = function ()
    print('tsserver attached')
  end,
})

lsp.configure('omnisharp', {
  on_attach = function ()
    print('omnisharp attached')
  end
})


lsp.configure('pyright', {
  settings = {
    python = {
      pythonPath = '/opt/homebrew/bin/python3.9'
    }
  },
  on_attach = function ()
    print('pyright attached')
  end
})

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

lsp.setup_nvim_cmp({
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,  }
  })

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- ** Use to print out client options ** --
  -- local function tprint (tbl, indent)
  --   if not indent then indent = 0 end
  --   local toprint = string.rep(" ", indent) .. "{\r\n"
  --   indent = indent + 2
  --   for k, v in pairs(tbl) do
  --     toprint = toprint .. string.rep(" ", indent)
  --     if (type(k) == "number") then
  --       toprint = toprint .. "[" .. k .. "] = "
  --     elseif (type(k) == "string") then
  --       toprint = toprint  .. k ..  "= "
  --     end
  --     if (type(v) == "number") then
  --       toprint = toprint .. v .. ",\r\n"
  --     elseif (type(v) == "string") then
  --       toprint = toprint .. "\"" .. v .. "\",\r\n"
  --     elseif (type(v) == "table") then
  --       toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
  --     else
  --       toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
  --     end
  --   end
  --   toprint = toprint .. string.rep(" ", indent-2) .. "}"
  --   return toprint
  -- end

  -- if client.name == 'prettierd' then
  --   print('found')
  -- end

  -- if client.name == 'tsserver' then

    -- local printer = tprint(client, 2)

    -- local file = io.open('ts_options', 'a')
    -- io.output(file)
    -- io.write(printer)
    -- io.close(file)

    -- print(printer)
  -- end

  -- if client.name == "eslint" then
  --     vim.cmd.LspStop('eslint')
  --     return
  -- end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>", opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>bf", ":lua vim.lsp.buf.format { async = true }<CR>")
end)

lsp.setup()

-- vim.diagnostic.config({
-- 	vitual_text = true,
-- })
vim.diagnostic.config({
  virtual_text = true,
  -- signs = true,
  -- update_in_insert = false,
  -- underline = true,
  -- severity_sort = false,
  -- float = true,
})
