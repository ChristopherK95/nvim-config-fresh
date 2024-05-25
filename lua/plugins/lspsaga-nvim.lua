return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			debug = false,
			border_style = "single",
			ui = {
				border_style = "single",
				lines = { "┗", "┣", "┃", "━", "┏" },
			},
			lightbulb = {
				enable = false,
			},
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			finder_action_keys = {
				open = "<CR>",
			},
			definition_action_keys = {
				edit = "<CR>",
			},
		})
	end,
}
