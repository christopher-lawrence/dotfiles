-- if vim.g.vscode then
print("nvim-win")
-- lazy.nvim requires 'mapleader' and 'maplocalleader' to be set before loading
require("config.remap")
require("config.set")
require("config.lazy")

-- LSP Configurations
require("lsps")

