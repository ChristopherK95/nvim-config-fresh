local config = function()
	local theme = require("lualine.themes.catppuccin")
	theme.normal.c.bg = nil

	-- vim.api.nvim_set_hl(0, 'LuaLineDiffAdd', {fg='#7aff73', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffChange', {fg='#ffef61', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffDelete', {fg='#ff5233', bg='#45475a'})

	require("lualine").setup({
		options = {
			theme = "catppuccin",
			globalstatus = true,
			component_separators = "",
		},
		sections = {
			lualine_a = {
				{
					"mode",
				},
			},
			lualine_b = {
				"branch",
				{
					"diff",
					-- diff_color = {
					-- 	added = "LuaLineDiffAdd", -- Changes the diff's added color
					-- 	modified = "LuaLineDiffChange", -- Changes the diff's modified color
					-- 	removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
					-- },
					symbols = { added = " ", modified = " ", removed = " " },
				},
				"diagnostics",
			},
			lualine_x = {
				"filetype",
			},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
