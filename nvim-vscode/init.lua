-- if vim.g.vscode then
print("nvim-vscode")
-- lazy.nvim requires 'mapleader' and 'maplocalleader' to be set before loading
require("config.remap")
require("config.set")
require("config.lazy")
-- else
--     print("ordinary Neovim")
-- end
