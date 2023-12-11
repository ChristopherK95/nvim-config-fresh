return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("typescript", "typescriptreact"):fmt("prettier")
		require('guard').setup({
			fmt_on_save = false,
		})
	end,
}
