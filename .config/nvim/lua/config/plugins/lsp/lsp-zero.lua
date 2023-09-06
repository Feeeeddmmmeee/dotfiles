return {
	"VonHeikemen/lsp-zero.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local lsp = require('lsp-zero')

		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					}
				}
			}
		}

		local map = function(mode, a, b, buf)
			vim.keymap.set(mode, a, b, { noremap = true, silent = true, buffer = buf })
		end

		lsp.preset('recommended')
		lsp.on_attach(function(client, bufnr)
			map("n", "gD", vim.lsp.buf.declaration, bufnr)
			map("n", "gr", ":Telescope lsp_references<CR>", bufnr)
			map("n", "gd", ":Telescope lsp_definitions<CR>", bufnr)
			map("n", "gt", ":Telescope lsp_type_definitions<CR>", bufnr)

			map("n", "<leader>ca", vim.lsp.buf.code_action, bufnr)
			map("n", "<leader>rn", vim.lsp.buf.rename, bufnr)
		end)

		lsp.set_sign_icons({error = '✘', warn = '▲', hint = '⚑', info = '»'})
		lsp.setup()
	end
}
