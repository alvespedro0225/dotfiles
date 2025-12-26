return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local config = require 'tokyonight'
    config.setup {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    }
    vim.cmd.colorscheme 'tokyonight'
  end,
}
