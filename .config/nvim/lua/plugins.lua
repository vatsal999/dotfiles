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

  use {
      'nvim-treesitter/nvim-treesitter',
      event = "BufRead",
       run = ':TSUpdate',
       config = function ()
           require "plugins.treesitter"
       end
  }

  use {
      'lukas-reineke/indent-blankline.nvim',
      after = "nvim-treesitter",
      config = function ()
          require "plugins.indent_blankline"
      end
  }

  use {
      'williamboman/nvim-lsp-installer',
  }

  use {
      'nvim-telescope/telescope.nvim',
      requires = {{ "nvim-lua/popup.nvim" }, {"nvim-lua/plenary.nvim"}},
      cmd = "Telescope",
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
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function ()
          require "plugins.nvimtree"
      end

  }
  use {
      'numToStr/Comment.nvim',
      keys = { "gc", "gb" },
      config = function ()
          require "plugins.Comment"
      end
  }

  use {
	"windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
        require("nvim-autopairs").setup {}
    end
}

  use {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
         require("plugins.colorizer")
      end,
  }
  use {
      "Pocco81/true-zen.nvim",
      cmd = {"TZMinimalist", "TZAtaraxis", "TZFocus"},
      config = function ()
          require("plugins.zenmode")
      end
  }

end)
