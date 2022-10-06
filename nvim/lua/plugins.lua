local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


return require("packer").startup({function(use)
  use "wbthomason/packer.nvim"
  
  -- Mason
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  -- Colorschemes
  use "folke/tokyonight.nvim"

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- Rust
  use "simrat39/rust-tools.nvim"
  use "mfussenegger/nvim-dap"

  -------------
  -- Code
  -------------
  -- Cmp plugins
  use {
   "hrsh7th/nvim-cmp",
   -- Sources
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-buffer",
   "hrsh7th/cmp-path",
   "hrsh7th/cmp-cmdline",
   "hrsh7th/cmp-nvim-lua",
   -- Source but snippet Engine 
   "L3MON4D3/LuaSnip",
   -- Snippets for LuaSnip 
   "rafamadriz/friendly-snippets",
  }
  -- Autopair
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  } 

  -- Others
  use "nvim-lua/plenary.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,

-- Have packer use a popup window
config = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}})
