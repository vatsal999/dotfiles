local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
      'sainnhe/gruvbox-material',
      config = function ()
          require "plugins.colorscheme"
      end
  }

  use {
      'neovim/nvim-lspconfig',
      config = function ()
          require "plugins.lspconfig"
      end
  }
  use {
      'rafamadriz/friendly-snippets',
      event = "InsertEnter",
  }

  use {
      'hrsh7th/nvim-cmp',
      event = "InsertEnter",
      config = function ()
          require "plugins.cmp"
      end
  }
  use {'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp",}

  use {
      'hrsh7th/cmp-buffer',
      after = "nvim-cmp"
  }
  use {
      'hrsh7th/cmp-path',
      after = "nvim-cmp"
  }
  use {'hrsh7th/cmp-vsnip',
        after = "nvim-cmp",
        config = function ()
            require "plugins.vsnip"
        end
  }

  use {'hrsh7th/vim-vsnip', after = "nvim-cmp"}
end)
