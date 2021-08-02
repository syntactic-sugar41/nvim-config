lua<<EOF
local action_set = require('telescope.actions.set')
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

-- Built-in actions
local transform_mod = require('telescope.actions.mt').transform_mod

-- or create your custom action
local my_cool_custom_action = transform_mod({
  x = function()
    local entry = action_state.get_selected_entry()
    print("This function ran after another action. Prompt_bufnr: " .. prompt_bufnr)
    -- Enter your function logic here. You can take inspiration from lua/telescope/actions.lua
  end,
})

require('telescope').setup {
 defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
          mirror = false,
          height = 0.7,
          preview_width = 0.6,
      },
      vertical = {
        mirror = false,
        height = 0.7,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false
      }, 
    find_files = {
      theme = "dropdown"
    },
    file_browser = {
      theme = "dropdown",
      previewer = false,
    },
    auto = {
      theme = "dropdown",
      previewer = false,
      mappings = {
          i = {
            ["<leader>s"] = actions.open_session,
          },
          n = {
            ["<leader>s"] = actions.open_session,
          },
      },
    },
    data = {
      theme = "dropdown",
      previewer = false,
      mappings = {
          i = {
            ["<leader>s"] = actions.open_session,
          },
          n = {
            ["<leader>s"] = actions.open_session,
          },
      },
    },
    casual = {
      theme = "dropdown",
      previewer = false,
      mappings = {
          i = {
            ["<leader>s"] = actions.open_session,
          },
          n = {
            ["<leader>s"] = actions.open_session,
          },
      },

    },
    tech = {
      theme = "dropdown",
      previewer = false,
      mappings = {
          i = {
            ["<leader>s"] = actions.open_session,
          },
          n = {
            ["<leader>s"] = actions.open_session,
          },
      },
  },
    sdk = {
      theme = "dropdown",
      previewer = false,
      mappings = {
          i = {
            ["<leader>s"] = actions.open_session,
          },
          n = {
            ["<leader>s"] = actions.open_session,
          },
      },
    },
},
}
EOF
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>gss <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gcc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gbb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<cr>


