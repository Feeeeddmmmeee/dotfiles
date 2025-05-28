-- Mapping function
local function map(mode, keybind, action, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, keybind, action, options)
end

-- Load current file as Lazy plugin config
map("n", "<leader>l", ":Lazy<CR>")

-- Moving code around in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- Select all
map("n", "<C-a>", "ggVG")
map("i", "<C-a>", "<ESC>ggVG")

-- Copying into system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- Vertical and horizontal split
map("n", "<C-]>", ":vs<CR>")
map("n", "<C-->", ":sp<CR>")

-- Finding and replacing a word in entire file
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
