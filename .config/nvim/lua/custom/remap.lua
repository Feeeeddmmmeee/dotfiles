-- Move code around in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

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
vim.keymap.set("n", "<leader>fm", vim.cmd.HopWord)

-- Changes word in entire file
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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
