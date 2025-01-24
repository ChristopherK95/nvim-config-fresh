local highlight = {
	"CursorColumn",
}

return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = false,
	main = "ibl",
	opts = {},
	config = function()
		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "CursorColumn", { fg = "#2f313d" })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
		})
	end,
}
