return {
  vim.lsp.config('ts_ls', {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  }),
}
