local telescope = require('telescope').setup{
	defaults = {
		layout_strategy = "flex"
	},
	pickers = {
		find_files = {
			hidden = true
		},
	},
	extensions = {
		file_browser = {
			hidden = true,
			grouped = true,
			hijak_netrw = true,
		}
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>rs', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps',  function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require("telescope").load_extension "file_browser"
