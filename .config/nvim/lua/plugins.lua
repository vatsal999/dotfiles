local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
      'morhetz/gruvbox',
      config = function ()
          require "plugins.gruvbox"
      end
  }

  use {
      'neovim/nvim-lspconfig',
      config = function ()
          require "plugins.lspconfig"
      end
  }

  use {
      'hrsh7th/nvim-cmp',
      config = function ()
          require "plugins.cmp"
      end
  }
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/vim-vsnip'}

  use {
      'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate',
       config = function ()
           require "plugins.treesitter"
       end
  }

  use {
      'williamboman/nvim-lsp-installer',
  }

  
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{ "nvim-lua/popup.nvim" }, {"nvim-lua/plenary.nvim"}},
      config = function ()
          require "plugins.telescope"
      end
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt =true},
      config = function ()
          require "plugins.lualine"
      end

  }
  use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function ()
          require "plugins.bufferline"
      end
  }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons',},
      config = function ()
          require "plugins.nvimtree"
      end

  }

  use {'tpope/vim-commentary'}


  -- Lazy loading:
  -- Load on specific commands
  --use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  --use {'andymass/vim-matchup', event = 'VimEnter'}
end)

