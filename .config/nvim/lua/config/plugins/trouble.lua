return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")

		vim.keymap.set("n", "<leader>pd", ":Trouble diagnostics<CR>")

		trouble.setup()
	end,
}
