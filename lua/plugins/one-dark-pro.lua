return {
	"navarasu/onedark.nvim",
	priority = 1000, -- Ensure it loads first
	init = function()
		require("onedark").setup({
			transparent = true,
			code_style = {
				keywords = "italic",
			},
			colors = {
				orange = "#e1be7e",
				light_grey = "#e86d5a",
				cyan = "#da787b",
				-- blue = "#61a9e6",
				blue = "#7dcbff",
				-- purple = "#c287ce",
				purple = "#de9deb",
				fg = "#b0b5c2",
			},
			highlights = {
				["@keyword.import"] = { fg = "@blue" },
				["@punctuation.special"] = { fg = "@blue" },
				["@string"] = { fg = "@green", fmt = "italic" },
			},
		})
		vim.cmd("colorscheme onedark")
	end,
}
