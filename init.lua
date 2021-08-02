-- Map leader to space
vim.g.mapleader = ' '

local fn = vim.fn
local execute = vim.api.nvim_command


local lualine = require 'lualine'

require('nvim-autopairs').setup()
require'range-highlight'.setup{}

require'lualine'.setup {
  options = {
      theme = 'tokyonight'
    }
}

vim.opt_global.shortmess:remove("F"):append("c")

local true_zen = require("true-zen")

true_zen.setup({
	ui = {
		bottom = {
			laststatus = 0,
			ruler = false,
			showmode = false,
			showcmd = false,
			cmdheight = 1,
		},
		top = {
			showtabline = 0,
		},
		left = {
			number = true,
			relativenumber = true,
			signcolumn = "no",
		},
	},
	modes = {
		ataraxis = {
			left_padding = 32,
			right_padding = 32,
			top_padding = 0,
			bottom_padding = 1,
			ideal_writing_area_width = {100},
			just_do_it_for_me = true,
			keep_default_fold_fillchars = true,
			custom_bg = {"none", ""},
			bg_configuration = true,
			quit = "untoggle",
			affected_higroups = {NonText = {}, FoldColumn = {}, ColorColumn = {}, VertSplit = {}, StatusLine = {}, StatusLineNC = {}, SignColumn = {}}
		},
		focus = {
			margin_of_error = 5,
			focus_method = "experimental"
		},
	},
	integrations = {
		vim_gitgutter = false,
		galaxyline = false,
		tmux = false,
		gitsigns = false,
		nvim_bufferline = false,
		limelight = false,
		twilight = false,
		vim_airline = false,
		vim_powerline = false,
		vim_signify = false,
		express_line = false,
		lualine = false,
	},
	misc = {
		on_off_commands = true,
		ui_elements_commands = true,
		cursor_by_mode = false,
	}
})


-- Sensible defaults
require('settings')
require('keymappings')
require('lsp_lua')
require('configs.treesitter')
require('plugins')
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
