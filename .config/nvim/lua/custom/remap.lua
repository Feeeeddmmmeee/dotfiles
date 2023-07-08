-- Move code around in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Mapping function
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Terminal
map("n", "<C-Enter>", ":ToggleTerm<CR><C-\\><C-n>i")
map("i", "<C-Enter>", "<ESC>:ToggleTerm<CR><C-\\><C-n>i")
map("t", "<C-Enter>", "<C-\\><C-n>:ToggleTerm<CR>")
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Copying into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", { noremap = true })
vim.keymap.set("n", "<leader>r", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>d", vim.cmd.Dashboard)
vim.keymap.set("n", "<leader>m", vim.cmd.Mason)
vim.keymap.set("n", "<leader>pd", vim.cmd.TroubleToggle)

-- Vertical and horizontal split
vim.keymap.set("n", "<C-n>", ":vs | :Telescope find_files<CR>")
vim.keymap.set("n", "<C-m>", ":sp | :Telescope find_files<CR>")

-- Moving quickly between open files
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Changes word in entire file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Bracket Autocompletion
map('i', '"', '""<left>')
map('i', "'", "''<left>")
map('i', "{", "{}<left>")
map('i', "(", "()<left>")
map('i', "[", "[]<left>")
map('i', "[]", "[]")
map('i', "()", "()")
map('i', "{}", "{}")
map('i', "''", "''")
map('i', '""', '""')
map('i', "{<CR>", "{<CR>}<Esc>O")
map('i', "(<CR>", "(<CR>)<Esc>O")
map('i', "[<CR>", "[<CR>]<Esc>O")
