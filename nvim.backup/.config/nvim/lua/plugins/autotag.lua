return {
  'windwp/nvim-ts-autotag',
  opts = {
    per_filetype = {
      ['tsx'] = {
        enable_close = true,
        enable_rename = true,
      },
    },
  },
  lazy = false,
}
