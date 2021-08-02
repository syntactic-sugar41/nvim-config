USER = vim.fn.expand('$USER')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
--
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()
require'utils'.opt('o', 'completeopt', 'menuone,noinsert,noselect')


-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Need for symbol highlights to work correctly
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])
----------------------------------
-- LSP Setup ---------------------
----------------------------------
metals_config = require("metals").bare_config
metals_config.init_options.statusBarProvider = "on"

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
}

local function map(mode, lhs, rhs)
  local opts = { noremap=true, silent=true }
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.cmd [[augroup lsp]]
vim.cmd [[au!]]
vim.cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
vim.cmd [[augroup end]]


map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")


local gopls = {
  -- capabilities = cap,
  filetypes = {"go", "gomod"},
  message_level = vim.lsp.protocol.MessageType.Error,
  cmd = {
    "gopls", -- share the gopls instance if there is one already
    "-remote=auto", --[[ debug options ]] --
    "-remote.debug=:0"
  },

  flags = {allow_incremental_sync = true, debounce_text_changes = 500},
  settings = {
    gopls = {
      -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
      -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
      -- not supported
      analyses = {unusedparams = true, unreachable = false},
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true --  // Show a code lens toggling the display of gc's choices.
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "fuzzy",
      experimentalDiagnosticsDelay = "500ms",
      -- diagnosticsDelay = "500ms",
      -- experimentalWatchedFileDelay = "100ms",
      symbolMatcher = "fuzzy",
      gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
      buildFlags = {"-tags", "integration"}
      -- buildFlags = {"-tags", "functional"}
    }
  },
    on_attach = on_attach,

}

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lsp-servers/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.config/nvim/lsp-servers/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
           diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    },
    on_attach = on_attach
}
-- Enable the following language servers
require'lspconfig'.gopls.setup(gopls)

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            }
        }
    }
}
