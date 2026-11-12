return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		-- Automatically install the parser when opening a buffer
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- Only process normal file buffers
				if vim.bo[args.buf].buftype == "" then
					return
				end
				if vim.api.nvim_buf_get_name(args.buf) == "" then
					return
				end

				local ft = vim.bo[args.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft)

				-- Oil passes all of the checks for some reason
				if not lang or lang == "oil" then
					return
				end

				-- Install parser if needed
				require("nvim-treesitter").install({ lang })

				-- Enable highlighting
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
