local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- colorschemes
    { "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
          require "plugins.colorscheme"
        end
    },
    {
      'sainnhe/gruvbox-material',
      name = "gruvbox",
      lazy = true,
      config = function ()
          require "plugins.colorscheme"
      end
    },
    {
      "m4xshen/hardtime.nvim",
      opts = {}
    },

    {
        "williamboman/mason.nvim",
        -- build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = function ()
            require "plugins.masonlsp"
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "williamboman/mason.nvim" },
        config = function() 
            require "plugins.masonlsp"
        end
    },
    {
      'neovim/nvim-lspconfig',
      event = { "BufReadPre", "BufNewFile" },
      config = function ()
          require "plugins.lspconfig"
      end
    },

    {
      'hrsh7th/nvim-cmp',
      event = "InsertEnter",
      dependencies = {
          {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/vim-vsnip',
          },
          {'hrsh7th/cmp-vsnip',
                dependencies = "rafamadriz/friendly-snippets",
                config = function ()
                    require "plugins.vsnip"
                end
          },
      },
      config = function ()
          require "plugins.cmp"
      end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },


  {
      'nvim-treesitter/nvim-treesitter',
       cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
       event = "BufRead",
       build = ':TSUpdate',
       config = function ()
           require "plugins.treesitter"
       end
  },

  {
      'lukas-reineke/indent-blankline.nvim',
      event = {"BufRead",},
      config = function ()
          require "plugins.indent_blankline"
      end
  },

  {
      'nvim-telescope/telescope.nvim',
      dependencies = {{ "nvim-lua/popup.nvim" }, {"nvim-lua/plenary.nvim"}},
      cmd = "Telescope",
      config = function ()
          require "plugins.telescope"
      end
  },

  -- {
  --     'nvim-lualine/lualine.nvim',
  --     dependencies = {'kyazdani42/nvim-web-devicons', lazy = true},
  --     config = function ()
  --         require "plugins.lualine"
  --     end
  --
  -- },
  {
      'akinsho/bufferline.nvim',
      dependencies = 'kyazdani42/nvim-web-devicons',
      config = function ()
          require "plugins.bufferline"
      end
  },

  {
      'kyazdani42/nvim-tree.lua',
      dependencies = {'kyazdani42/nvim-web-devicons'},
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function ()
          require "plugins.nvimtree"
      end

  },
  {
      'numToStr/Comment.nvim',
      keys = { {"gc", "gb"}, },
      config = function ()
          require "plugins.Comment"
      end
  },


  {
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
         require("plugins.colorizer")
      end,
  },
  {
      "Pocco81/true-zen.nvim",
      cmd = {"TZMinimalist", "TZAtaraxis", "TZFocus"},
      config = function ()
          require("plugins.zenmode")
      end
  }
},
{
    defaults = {
        lazy = false, -- should plugins be lazy-loaded?
    },
    performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },

    }
}
)
