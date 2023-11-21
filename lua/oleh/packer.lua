vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { 
        {'nvim-lua/plenary.nvim'}, 
        {'nvim-tree/nvim-web-devicons'}
    }
  }

  use('nvim-telescope/telescope-fzf-native.nvim', {run = 'make'})
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  --Source tree
  use('nvim-tree/nvim-tree.lua')

-- color schemes  
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use('zacanger/angr.vim')

-- code formatter
  use {'mhartington/formatter.nvim'}

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  -- LSP (Language Server Protocol)
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
          require("trouble").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  }

  use { "puremourning/vimspector" }

  use { "godlygeek/tabular" }
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  --use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use { "preservim/vim-markdown" }
  use { "mzlogin/vim-markdown-toc" }

  use { "cdelledonne/vim-cmake" }

  --co-pilot test
  -- use { "github/copilot.vim" }

  -- rust support
  use { "neovim/nvim-lspconfig" }
  use { "simrat39/rust-tools.nvim" }
  use { "voldikss/vim-floaterm" }
end)
