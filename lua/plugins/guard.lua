return {
	"nvimdev/guard.nvim",
	lazy = false,
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("typescript,typescriptreact"):fmt("prettier")
		ft("lua"):fmt("stylua")
		ft("go"):fmt("gofmt")

		require("guard").setup({
			fmt_on_save = false,
			lsp_as_default_formatter = true,
		})
	end,
}
