--
-- See formatter.nvim: https://github.com/mhartington/formatter.nvim
--
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettierd,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },
    html = {
      require("formatter.filetypes.html").prettierd,
    },
    htmldjango = {
      require("formatter.filetypes.html").prettierd,
    },
    python = {
      require("formatter.filetypes.python").isort,
      require("formatter.filetypes.python").black,

      -- You can also define your own configuration
      -- function()
      --   print('isort setup')
      --   -- Full specification of configurations is down below and in Vim help
      --   -- files
      --   return {
      --     exe = "isort",
      --     args = {
      --       "-v",
      --       "-",
      --     },
      --     stdin = true,
      --   }
      -- end
    },
  }
}
