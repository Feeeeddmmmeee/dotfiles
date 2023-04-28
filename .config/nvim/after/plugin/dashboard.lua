local nvim = {
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
	[[]],
	[[]],
	[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
	[[]],
	[[]],

}

local doom = {
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
	[[=================     ===============     ===============   ========  ========]],
	[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
	[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
	[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
	[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
	[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
	[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
	[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
	[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
	[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
	[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
	[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
	[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
	[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
	[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
	[[||.=='    _-'                                                     `' |  /==.||]],
	[[=='    _-'                        N E O V I M                         \/   `==]],
	[[\   _-'                                                                `-_   /]],
	[[ `''                                                                      ``' ]],
}

local random = {nvim, doom}

require('dashboard').setup({
	theme = 'doom',
	config = {
		header = doom,
		-- header = random[math.random(#random)],
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
				desc = 'Config           ',
				desc_hl = 'String',
				key = 'c',
				key_hl = 'Number',
				action = 'edit ~/.config/nvim/init.lua'
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
