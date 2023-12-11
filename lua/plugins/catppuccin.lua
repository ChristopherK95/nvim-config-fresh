return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd("colorscheme catppuccin")
		require("catppuccin").setup({
			integration = {
				cmp = true,
				gitsigns = true,
				lualine = true,
			},
		})
	end,
}
