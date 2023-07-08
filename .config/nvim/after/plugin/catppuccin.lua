require("catppuccin").setup {
    flavour = "mocha",
    highlight_overrides = {
        mocha = function(mocha)
            return {
				-- This is required for the telescope background to be transparent
				TelescopeNormal = { bg = mocha.none},
				ToggleTerm = { bg = mocha.none }

            }
        end,
    },
}

-- Colors
vim.cmd.colorscheme "catppuccin"
