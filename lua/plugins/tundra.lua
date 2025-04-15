local config = {
	transparent_background = false,
	syntax = {
		booleans = { bold = true, italic = true },
		operators = { bold = true, italic = false },
		comments = { bold = true, italic = true },
		conditionals = {},
		constants = { bold = true },
		fields = {},
		functions = { italic = true },
		keywords = { bold = true, italic = true },
		loops = { italic = true },
		numbers = { bold = true },
		punctuation = {},
		strings = {},
		types = { italic = true },
	},
	plugins = {
		lsp = true,
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
		vim.g.tundra_biome = "jungle"
		vim.opt.background = "dark"
		vim.cmd("colorscheme tundra")
	end,
}
