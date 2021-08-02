local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

cmd 'set background=dark'
cmd 'set termguicolors'
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_lualine_bold = false
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }


cmd[[colorscheme tokyonight]]

cmd 'set updatetime=100'
cmd 'set noswapfile'
cmd[[set wildmenu]]
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'hlsearch', false)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest,full')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
