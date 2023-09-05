local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'lua_ls',
  'tsserver',
  'omnisharp',
  'eslint',
  'pyright',
  'ruff_lsp',
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

-- https://github.com/typescript-language-server/typescript-language-server
lsp.configure('tsserver', {
  -- init_options = {
  --   tsserver = {
  --     logVerbosity = 'verbose',
  --     trace = 'verbose',
  --     logDirectory = './log',
  --   },
  -- },
  on_attach = function()
    print('tsserver attached')
  end,
})

lsp.configure('omnisharp', {
  on_attach = function()
    print('omnisharp attached')
  end
})


lsp.configure('pyright', {
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        diagnosticMode = 'workspace',
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "warning",
          reportOptionalMemberAccess = false
        }
      },
      venv = "venv",
      pythonPath = "python3"
      -- pythonPath = '/opt/homebrew/bin/python3.9'
    }
  },
  on_attach = function()
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
    end,
  }
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(client, bufnr)
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
end

local lsp_onattach_keymaps = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

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
end

lsp.on_attach(function(client, bufnr)
  -- Disabling format on save for now
  -- lsp_format_on_save(client, bufnr)

  lsp_onattach_keymaps(client, bufnr)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  -- signs = true,
  -- update_in_insert = false,
  -- underline = true,
  -- severity_sort = false,
  -- float = true,
})
