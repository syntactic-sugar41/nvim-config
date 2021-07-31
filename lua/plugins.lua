return require('packer').startup(function()
  use {'wbthomason/packer.nvim' }


  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'glepnir/lspsaga.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'fenetikm/falcon' }
  use { 'folke/tokyonight.nvim' }
  use { 'nvim-lua/completion-nvim' }
  use {'kyazdani42/nvim-web-devicons' } 
  use { 'kyazdani42/nvim-tree.lua' }
  use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
 }
  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'sindrets/diffview.nvim'
  use { 'glepnir/dashboard-nvim' }
  use { 'airblade/vim-rooter' }
  use "Pocco81/TrueZen.nvim"
  use 'airblade/vim-gitgutter'
  use 'christoomey/vim-tmux-navigator'
  use 'APZelos/blamer.nvim'
  use 'b3nj5m1n/kommentary'
  use 'psliwka/vim-smoothie'


  end)
