return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
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
			},
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown({
					winblend = 0,
					layout_config = {
						width = 0.5,
						height = 0.4,
					}
				})
			}
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.command_history, {})

		local grep_active_word = function()
			return builtin.grep_string({search = vim.fn.expand("<cword>")})
		end

		vim.keymap.set("n", "<leader>fw", grep_active_word, {})
		vim.api.nvim_create_user_command("GrepCword", grep_active_word, {})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
