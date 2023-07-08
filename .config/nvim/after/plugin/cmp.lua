local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false})
	}
})
