-- Packer Plugins
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		require = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Colors
	use { 'catppuccin/nvim', as = 'catppuccin' }

	-- Fuzzy Finder
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- File Browser
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
	}

	-- Nvim Treesitter
	-- use 'nvim-treesitter/playground'
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Undo Tree
	use 'mbbill/undotree'

	-- Discord Rich Presence
	use 'andweeb/presence.nvim'

	-- Startup screen
	use 'glepnir/dashboard-nvim'

	-- Hiding relative line numers automatically when needed
	use "sitiom/nvim-numbertoggle"

	-- Smooth scrolling
	-- use 'karb94/neoscroll.nvim'
	use {
		'declancm/cinnamon.nvim',
		config = function() require('cinnamon').setup() end
	}

	-- Easier comments
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- CSS color highlighting
	use 'norcalli/nvim-colorizer.lua'

	-- Terminal
	use {"akinsho/toggleterm.nvim", tag = '*'}

	-- Diagnostics
	use 'folke/trouble.nvim'

	-- Yuck syntax highlighting
	-- use 'gpanders/nvim-parinfer'
	use 'elkowar/yuck.vim'

	-- Previewing images as ASCII
	use {
		'samodostal/image.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	-- Simple markdown preview
	use 'ellisonleao/glow.nvim'

	-- LSP based context bar
	use {
		'utilyre/barbecue.nvim',
		tag = '*',
		requires = {
			'SmiteshP/nvim-navic',
			{
				'm00qek/baleia.nvim',
				tag = 'v1.3.0'
			}
		}
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {

			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
end)
