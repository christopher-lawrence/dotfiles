-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- themes
  use 'arcticicestudio/nord-vim'
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'Mofiqul/vscode.nvim'

  -- some kind of tree parser
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- amazing file switcher
  use('ThePrimeagen/harpoon')

  -- undo pane
  use('mbbill/undotree')

  -- git
  use('tpope/vim-fugitive')

  -- smooth scrolling
  use('psliwka/vim-smoothie')

  -- lsp-zero
  use{
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- null-ls lsp
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }

  -- Lua functions, some plugins require it
  use {'nvim-lua/plenary.nvim'}

  -- git icons in the gutter
  -- use { 'airblade/vim-gitgutter' }

  -- git signs: testing this out. seems very nice
  use {
  'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }

  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- use({
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --     local saga = require("lspsaga")

  --     saga.init_lsp_saga({
  --       -- your configuration
  --     })
  --   end,
  -- })

end)