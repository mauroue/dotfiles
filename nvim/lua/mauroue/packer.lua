-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Recommended, not required.
  use {
	  'daltonmenezes/aura-theme',
	  rtp = 'packages/neovim',
	  config = function()
		  vim.cmd("colorscheme aura-dark") -- Or any Aura theme available
	  end
  }
  use ('theprimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},     -- Required
          {'hrsh7th/cmp-nvim-lsp'}, -- Required
          {'L3MON4D3/LuaSnip'},     -- Required
      }
  }
  -- Lua
  use {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }
  use {
      'amirali/yapf.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function()
          require('yapf').setup {
              command= "--style='{based_on_style: google}'"
          }
      end,
  }
  use {'mfussenegger/nvim-dap'}
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use { "christoomey/vim-tmux-navigator" }
end)
