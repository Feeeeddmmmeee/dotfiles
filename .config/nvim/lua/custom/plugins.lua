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
	use { "catppuccin/nvim", as = "catppuccin" }
	
	-- Fuzzy Finder
	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.1',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	-- Nvim Treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'nvim-treesitter/playground'

	-- Undo Tree
	use 'mbbill/undotree'

	-- Discord Rich Presence
	use 'andweeb/presence.nvim'

	-- Startup screen
	use 'glepnir/dashboard-nvim'

	-- Notifications
	use 'rcarriga/nvim-notify'

	-- Hiding relative line numers automatically when needed
	use "sitiom/nvim-numbertoggle"

	-- Help menu
	use {
		'sudormrfbin/cheatsheet.nvim',

		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
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
