return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")

		vim.keymap.set("n", "<leader>pd", ":TroubleToggle<CR>")

		trouble.setup()
	end,
}
