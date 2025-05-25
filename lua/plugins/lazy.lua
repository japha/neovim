return { 
	{'nvim-lua/plenary.nvim'},
	{'nvim-tree/nvim-web-devicons'},

	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', },

	{'nvim-telescope/telescope-fzf-native.nvim'},
	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-treesitter/playground'},

	--Source tree
	{'nvim-tree/nvim-tree.lua'},

	-- color schemes
	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes'},
	{'zacanger/angr.vim'},

	-- code formatter
	{'mhartington/formatter.nvim'},

	{'mbbill/undotree'},
	{'tpope/vim-fugitive'},

	-- LSP (Language Server Protocol)
	-- LSP Support
	{'neovim/nvim-lspconfig'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	-- Autocompletion
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'saadparwaiz1/cmp_luasnip'},
	{'hrsh7th/cmp-nvim-lua'},

	--Snippets
	{'L3MON4D3/LuaSnip'},
	{'rafamadriz/friendly-snippets'},

	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to the default settings
				-- refer to the configuration section below
			}
		end
	},

	-- cppman
	{
		'madskjeldgaard/cppman.nvim',
		requires = {
			{ 'MunifTanjim/nui.nvim' }
		},
		config = function()
			local cppman = require"cppman"
			cppman.setup()

		end
	},

	{ "puremourning/vimspector" },

	{ "godlygeek/tabular" },
	-- install without yarn or npm
	{{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}},

	--{{ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
	{ "preservim/vim-markdown" },
	{ "mzlogin/vim-markdown-toc" },

	{ "cdelledonne/vim-cmake" },

	--co-pilot test
	-- { "github/copilot.vim" }

	-- rust support
	{ "simrat39/rust-tools.nvim" },
	{ "voldikss/vim-floaterm" }
}
