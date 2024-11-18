return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		win_options = {
			winhl = "Normal:Normal,Float:Float",
		},
		view_options = {
			show_hidden = true,
		},
		confirmation = {
			win_options = {
				winhl = "Normal:Normal,Float:Float",
			},
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
