require("custom.set")

-- Remaps because putting them in ./lua/custom didnt work 
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>r", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Bracket Autocompletion
map('i', '"', '""<left>')
map('i', "'", "''<left>")
map('i', "{", "{}<left>")
map('i', "(", "()<left>")
map('i', "[", "[]<left>")
map('i', "{<CR>", "{<CR>}<Esc>O")
map('i', "(<CR>", "(<CR>)<Esc>O")
map('i', "[<CR>", "[<CR>]<Esc>O")

-- Colors
vim.cmd.colorscheme "catppuccin"

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
	use 'nvim-treesitter/playground'

	-- Undo Tree
	use 'mbbill/undotree'

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
