return {
	"mason-org/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require('mason').setup({
			ui = {
				icons = {
					package_installed = "󰸞",
					package_pending = "",
					package_uninstalled = "✗"
				},
				border = "rounded",
			}
		})
		require('mason-lspconfig').setup({
			ensure_installed = {
				"lua_ls",
				"clangd"
			},
			handlers = {
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
			}
		})
	end
}
