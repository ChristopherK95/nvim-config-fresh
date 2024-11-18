return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	init = function()
		require("catppuccin").setup({
			transparent_background = true,
			-- transparent_background = false,
			integration = {
				cmp = true,
				gitsigns = true,
				lualine = true,
			},
		})
		-- vim.cmd("colorscheme catppuccin")
	end,
}
