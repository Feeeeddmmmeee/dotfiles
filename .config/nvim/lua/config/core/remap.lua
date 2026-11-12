-- Mapping function
local function map(mode, keybind, action, opts)
	local options = { noremap = true}
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, keybind, action, options)
end

-- Open Lazy menu
map("n", "<leader>l", ":Lazy<CR>")

-- Open mason
map("n", "<leader>m", ":Mason<CR>")

-- Moving code around in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- Select all
map("n", "<leader>a", "ggVG")
map("v", "<leader>a", "<ESC>ggVG")

-- Format active buffer
map("n", "<leader>=", "mzggVG=`z")
map("v", "<leader>=", "<ESC>mzggVG=`z")

-- Copying into system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- Vertical and horizontal split
map("n", "<leader>]", ":vs<CR>")
map("n", "<leader>-", ":sp<CR>")

-- Finding and replacing a word in entire file
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Keep selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- Restart config
map("n", "<leader>re", "<cmd>restart<CR>")

-- Lsp bindings
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({
        border = "rounded",
    })
end, { desc = "LSP Hover Documentation" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    desc = "Go to Definition",
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
    desc = "Rename Symbol",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
    desc = "Code Action",
})
