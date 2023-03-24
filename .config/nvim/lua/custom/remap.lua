vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>r", vim.cmd.PackerSync)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Replace current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
