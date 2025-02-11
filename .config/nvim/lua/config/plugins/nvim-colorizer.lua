return {
	"norcalli/nvim-colorizer.lua",
	config = function ()
		require 'colorizer'.setup {
			'*';
			svelte = { css = true, css_fn = true };
			css = { css = true, css_fn = true };
			scss = { css = true, css_fn = true };
		}
	end
}
