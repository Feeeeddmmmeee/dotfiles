return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				layout_startegy = "flex",
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true
				}
			}
		})

		vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {})
		vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", {})
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {})
		vim.keymap.set("n", "<leader>fh", ":Telescope command_history<CR>", {})

		local grep_active_word = function()
			return builtin.grep_string({search = vim.fn.expand("<cword>")})
		end

		vim.keymap.set("n", "<leader>fw", grep_active_word, {})
		vim.api.nvim_create_user_command("GrepCword", grep_active_word, {})

		telescope.load_extension("fzf")
	end,
}
