local map = vim.keymap.set
return {
  map('n', '<Esc>', '<cmd>nohlsearch<CR>'),
  map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' }),
  map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }),
  map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>'),
  map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>'),
  map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>'),
  map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>'),
  map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' }),
  map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' }),
  map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' }),
  map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' }),
  map('n', '<C-d>', vim.diagnostic.open_float, { desc = 'Open error float' }),
  map('n', 'grn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' }),
  map('n', 'gra', vim.lsp.buf.code_action, { desc = '[G]oto Code [A]ction' }),
  map('n', 'grD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' }),
}
