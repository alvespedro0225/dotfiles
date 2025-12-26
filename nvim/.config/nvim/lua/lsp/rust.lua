local M = {}
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
      assist = {
        preferSelf = true,
      },
      diagnostics = {
        styleLints = {
          enable = true,
        },
      },
    },
  },
})
vim.lsp.enable "rust_analyzer"
return M
