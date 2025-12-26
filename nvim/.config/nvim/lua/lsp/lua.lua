local M = {}
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        callSnipet = "Replace",
      },
      diagnostics = {
        severity = {
          ["unused-global"] = "Warning",
          ["lowercase-global"] = "Warning",
        },
      },
    },
  },
})
vim.lsp.enable "lua_ls"

return M
