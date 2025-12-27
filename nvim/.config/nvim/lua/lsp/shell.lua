local M = {}

vim.lsp.config("bashls", {
  allowlist = { "sh", "bash" },
})
vim.lsp.enable "bashls"

return M
