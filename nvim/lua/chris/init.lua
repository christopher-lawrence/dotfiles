-- lua will load this file from the root "init.lua" because the name is "init.lua"
require("chris.remap")
require("chris.set")

vim.cmd("let g:vimwiki_list = [{'path': '~/.config/wiki/'}]")
