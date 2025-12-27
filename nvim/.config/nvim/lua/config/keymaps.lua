local map = vim.keymap.set
local M = {}

local function open_link()
  local link = vim.fn.expand "<cword>"
  link = string.gmatch(link, ".*(http[^%(%)%[%]]+)%)?")()
  if link == nil then
    return
  end
  local browser = vim.fn.system "xdg-settings get default-web-browser"
  browser = string.gmatch(browser, "(.+)%.desktop")()
  local command = string.format("%s --new-tab %s", browser, link)
  vim.fn.system(command)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-d>", vim.diagnostic.open_float, { desc = "Opens a floating window for errors" })
map("n", "<leader>R", "<cmd>source %<CR>", { desc = "Reload nvim configs" })
map("n", "<leader>x", ":.lua<CR>", { desc = "Execute current line in lua" })
map("v", "<leader>x", ":lua<CR>", { desc = "Execute selected lines in lua" })
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to the down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
map("n", "<C-y>", "<C-w>q", { desc = "Kills current window" })
map("n", "<C-v>", ":vsplit<CR>", { desc = "Splits window verticaly" })
map("n", "<C-b>", ":split<CR>", { desc = "Splits window horizontaly" })
map("n", "<M-l>", ":cnext<CR>", { desc = "Moves to the next quickfix item" })
map("n", "<M-h>", ":cprev<CR>", { desc = "Moves to the previous quickfix item" })
map("n", "<leader>ol", open_link, { desc = "Opens link in a new browser tab" })

return M
