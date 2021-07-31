lua<<EOF
require('telescope').setup()

EOF
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>gss <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gcc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gbb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<cr>

