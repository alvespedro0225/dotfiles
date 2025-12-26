return {
  'julianolf/nvim-dap-lldb',
  dependencies = { 'mfussenegger/nvim-dap' },
  opts = { codelldb_path = '/home/pedro/.local/share/nvim/mason/bin/codelldb' },
  configurations = {
    rust = {
      {
        name = 'Launch debbuger',
        type = 'lldb',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = function()
          local out = vim.fn.system { 'cargo build' }
          if vim.v.shell_error ~= 0 then
            vim.notify(out, vim.log.levels.ERROR)
            return nil
          end
        end,
      },
    },
  },
}
