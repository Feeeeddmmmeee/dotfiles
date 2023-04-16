local telescope = require('telescope').setup{
	pickers = {
		find_files = {
			hidden = true
		},
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps',  function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
