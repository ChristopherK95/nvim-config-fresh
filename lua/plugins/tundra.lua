local config = {
	transparent_background = true,
	plugins = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
	},
}

return {
	"sam4llis/nvim-tundra",
	lazy = false,
	priority = 1000,
	init = function()
		require("nvim-tundra").setup(config)
    -- vim.g.tundra_biome = 'jungle'
		-- vim.cmd("colorscheme tundra")
	end,
}
