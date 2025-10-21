h1 = [[
                                       
    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ 
     █  █▀   ▀  █   █      █  ██ █ █ █ 
 ██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ 
 █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ 
 █  █ █ ▀███▀           █  █   ▐    █  
 █   ██                  █▐        ▀   
                         ▐             
                                       
]]

h2 = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
 ]]

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	---@type snacks.Config
	opts = {
		dashboard = {
			preset = {
				keys = {
					{ icon = "󰈞 ", key = "f", desc = "Find File", action = ":Telescope find_files"},
					{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles"},
					{ icon = " ", key = "p", desc = "Plugins", action = ":Lazy"},
					{ icon = "󰗼 ", key = "q", desc = "Quit", action = ":qa"}
				},
				header = h2
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 2 },
				{ section = "startup"}
			}
		},
		notifier = { enabled = true },
		image = { enabled = true },
		bigfile = { enabled = true },
		quickfile = { enabled = true },

		scroll = { enabled = false },
		indent = { enabled = false },
		explorer = { enabled = false },
	},
}
