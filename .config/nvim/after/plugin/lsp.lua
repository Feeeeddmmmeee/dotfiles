local lsp = require('lsp-zero')

require("lspconfig").lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

lsp.preset('recommended')
lsp.set_sign_icons({error = '✘', warn = '▲', hint = '⚑', info = '»'})
lsp.setup()
