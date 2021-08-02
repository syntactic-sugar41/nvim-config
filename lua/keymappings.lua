local utils = require('utils')

utils.map('n', ';', ':')

utils.map('n', '<C-H>', '<C-W><C-H>')
utils.map('n', '<C-J>', '<C-W><C-J>')
utils.map('n', '<C-L>', '<C-W><C-L>')
utils.map('n', '<C-K>', '<C-W><C-K>')

utils.map('i', 'jj', '<ESC>')
utils.map('i', 'JJ', '<ESC>')
utils.map('n', '<C-n>', ':NvimTreeTogle<CR>')
utils.map('n', '<C-t>', ':TZAtaraxis<CR>')
