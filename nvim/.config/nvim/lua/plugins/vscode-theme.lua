return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  config = function()
    local c = require('vscode.colors').get_colors()
    require('vscode').setup {
      italic_comments = false,
      italic_inlayhints = true,
      terminal_colors = true,
      color_overrides = {
        vscAccentBlue = '#f796dc',
      },
    }
    vim.cmd.colorscheme 'vscode'
  end,
}
