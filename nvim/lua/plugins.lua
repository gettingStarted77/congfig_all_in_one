-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


return require("packer").startup({ function(use)
  use "wbthomason/packer.nvim"


  ---------- UI ----------
  -- Colorschemes
  use "folke/tokyonight.nvim"
  -- Lueline
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true
    }
  }
  -- Nvim-tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  }
  -- Bufferline
  use { "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons"
  }


  ---------- CODE ----------
  -- Mason
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
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
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }


  -- Others --
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  -- Which-key
  use "folke/which-key.nvim"
  -- Autopair
  use "windwp/nvim-autopairs"


  ---------- RUST ----------
  use "simrat39/rust-tools.nvim"
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end,

  -- Have packer use a popup window
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    }
  }
})
