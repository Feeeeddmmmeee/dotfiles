return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons"
	},
	config = function()
		local lualine = require('lualine')
		local lazy_status = require("lazy.status")
		local mocha = require("catppuccin.palettes").get_palette "mocha"

		lualine.setup {
			options = {
				theme = "catppuccin",
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_b = { 'filename', 'branch', 'diff' },
				lualine_c = { 'fileformat' },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = mocha["peach"] },
					},
				},
				lualine_y = { 
					'filesize',
					'filetype',
					'progress',
				},
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { 'filename' },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'location' },
			},
			tabline = {},
			extensions = {},
		}

	end,
}
