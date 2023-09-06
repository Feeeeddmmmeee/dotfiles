return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 51,
	config = function()
		require("catppuccin").setup {
			flavour = "mocha",
			highlight_overrides = {
				mocha = function(mocha)
					return {
						Normal = { bg = mocha.none },
						NormalNC = { bg = mocha.none },
						NormalSB = { bg = mocha.none },
						NormalFloating = { bg = mocha.none },
						NormalFloat = { bg = mocha.none },
					}
				end,
			},
		}

		-- Colors
		vim.cmd.colorscheme "catppuccin"

	end,
}
