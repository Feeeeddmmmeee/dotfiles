return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<space>pv", ":Oil<CR>")
	end
}
