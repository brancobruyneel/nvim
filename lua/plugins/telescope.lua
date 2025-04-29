local small_layout = {
	width = function(_, cols, _)
		if cols > 120 then
			return 120
		end

		return math.floor(cols * 0.87)
	end,
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' }
	},
	cmd = "Telescope",
	opts = function(_, conf)
		require('telescope').load_extension('fzf')

		conf.defaults.mappings.i = {
			['<C-p>'] = require('telescope.actions.layout').toggle_preview
		}

		conf.pickers = {
			git_branches = {
				previewer = false,
				layout_config = small_layout,
			},
			diagnostics = {
				previewer = false,
				layout_config = small_layout,
			},
			keymaps = {
				previewer = false,
				layout_config = small_layout,
			},
		}

		conf.extensions_list = { "themes", "terms", "dap" }

		return conf
	end
}
