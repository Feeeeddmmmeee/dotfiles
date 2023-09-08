return {
	"glepnir/dashboard-nvim",
	config = function()
		local dashboard = require("dashboard")
		local logo = {
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[]],
		[[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
		[[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
		[[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
		[[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
		[[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
		[[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
		[[                                        With LAZY]],
		[[]],
		}

		dashboard.setup({
			theme = "doom",
			config = {
				header = logo,
				center = {
					{
						icon = '󰈞 ',
						icon_hl = 'Title',
						desc = 'Find File           ',
						desc_hl = 'String',
						key = 'f',
						key_hl = 'Number',
						action = 'Telescope find_files'
					},
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'Recent Files           ',
						desc_hl = 'String',
						key = 'r',
						key_hl = 'Number',
						action = 'Telescope oldfiles'
					},
					{
						icon = ' ',
						icon_hl = 'Title',
						desc = 'Plugins           ',
						desc_hl = 'String',
						key = 'p',
						key_hl = 'Number',
						action = 'Lazy'
					},
					{
						icon = '󰗼 ',
						icon_hl = 'Title',
						desc = 'Quit           ',
						desc_hl = 'String',
						key = 'q',
						key_hl = 'Number',
						action = 'q'
					}
				}
			}
		})
	end
}
