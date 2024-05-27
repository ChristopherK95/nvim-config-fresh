return {
	"mistricky/codesnap.nvim",
	lazy = false,
	build = "make",
	config = function()
		require("codesnap").setup({
			has_breadcrumbs = true,
			watermark = "",
			has_line_number = true,
		})
	end,
}
