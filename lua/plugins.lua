return require('packer').startup(function(use)

  -- Packer
  use 'wbthomason/packer.nvim'

	-- Improve startup of neovim
	use 'lewis6991/impatient.nvim'

	-- Themes
	use 'ellisonleao/gruvbox.nvim'
	use 'navarasu/onedark.nvim'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Tree
	--[[ use {
		'kyazdani42/nvim-tree.lua',
	} --]]

	-- Treesiter
	use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
	}
	use 'windwp/nvim-ts-autotag'
	use 'p00f/nvim-ts-rainbow'
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	-- Move windows
	use 'sindrets/winshift.nvim'
	-- Move lines and blocks
	use 'fedepujol/move.nvim'

	-- Line
	use {
  'nvim-lualine/lualine.nvim',
	}
	-- Buffers
	--use {'akinsho/bufferline.nvim', tag = "v2.*"}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use { "nvim-telescope/telescope-file-browser.nvim" } -- "Tree"

	-- cmp - Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp' -- for lsp completion 
	use 'hrsh7th/cmp-nvim-lua' -- for lua completion 

	-- Snippets
	use 'L3MON4D3/LuaSnip' -- engine
	use 'rafamadriz/friendly-snippets' -- snippets to use

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/mason.nvim',
    "williamboman/mason-lspconfig.nvim"
	}
	use 'RRethy/vim-illuminate' -- show highlight of objects better
	use  'ray-x/lsp_signature.nvim' -- show info about objects

	-- Terminal
	use {"akinsho/toggleterm.nvim", tag = 'v2.*'	}

	-- Harpoon, move in files with marks
	use 'ThePrimeagen/harpoon'

	-- SQL Client
	use {
		'kristijanhusak/vim-dadbod-ui',
		requires = {
			'tpope/vim-dadbod',
			'tpope/vim-dotenv'
		}
	}

end)
