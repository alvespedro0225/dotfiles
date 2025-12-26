-- Highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank.highlight", { clear = true }),
  pattern = "*",
  callback = function()
    vim.hl.on_yank()
  end,
})

return {}
