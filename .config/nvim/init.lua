vim.opt.termguicolors = true
require("config.core")
require("config.lazy")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})
