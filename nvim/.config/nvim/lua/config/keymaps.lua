local map = vim.keymap.set
local M = {}

map("n", "<C-d>", vim.diagnostic.open_float, { desc = "Opens a floating window for errors" })
map("n", "<space>R", "<cmd>source %<CR>", { desc = "Reload nvim configs" })
map("n", "<space>x", ":.lua<CR>", { desc = "Execute current line in lua" })
map("v", "<space>x", ":lua<CR>", { desc = "Execute selected lines in lua" })
map("n", "\\", ":e .<CR>", { desc = "Open file explorer" })
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to the down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
map("n", "<C-y>", "<C-w>q", { desc = "Kills current window" })
map("n", "<C-v>", ":vsplit<CR>", { desc = "Splits window verticaly" })
map("n", "<C-b>", ":split<CR>", { desc = "Splits window horizontaly" })
map("n", "<M-l>", ":cnext<CR>", { desc = "Moves to the next quickfix item" })
map("n", "<M-h>", ":cprev<CR>", { desc = "Moves to the previous quickfix item" })

vim.g.mapleader = " "
vim.g.maplocalleader = " "
return M
