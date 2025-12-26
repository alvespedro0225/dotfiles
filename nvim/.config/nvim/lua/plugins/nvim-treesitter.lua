return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local tree_sitter = require "nvim-treesitter"
    tree_sitter.install {
      "c",
      "rust",
      "lua",
      "markdown",
      "markdown_inline",
      "dockerfile",
      "bash",
      "fish",
      "javascript",
      "css",
      "typescript",
      "dart",
      "c_sharp",
      "python",
      "html",
    }
  end,
}
