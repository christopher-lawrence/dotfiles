vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- I dont know what these do...
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- vim.keymap.set("n", "<leader>vwm", function()
--   require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--   require("vim-with-me").StopVimWithMe()
-- end)
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
-- Buffers
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
vim.keymap.set("n", "<leader>bl", '<cmd>b#<CR>')

-- Trouble
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- why does this internal command need to be quoted??
vim.keymap.set(
  {"n", "v"},
  "<leader>f",
  function()
    vim.lsp.buf.format()
  end
)
-- vim.keymap.set("v", "<leader>f",
--   ":lua vim.lsp.buf.format({ async = true, range = { ['start'] = vim.api.nvim_buf_get_mark(0, '<'), ['end'] = vim.api.nvim_buf_get_mark(0, '>')} })<CR>")
-- Formatter -- disabling to let the buffer specific formatter run. Just run :Format to use formatter
vim.keymap.set("n", "<leader>F", ":Format<cr>")

-- Select buffer 2 -- on the left -- during merge conflic / diff view
vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
-- Select buffer 3 -- on the right -- during merge conflic / diff view
vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>")
