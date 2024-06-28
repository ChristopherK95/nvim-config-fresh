local czs = require("czs")

local theme = {
	inactive = {
		a = { fg = "white", bg = "transparent", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
	visual = {
		a = { fg = "#C678DD", bg = "transparent", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
	replace = {
		a = { fg = "white", bg = "transparent", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
	normal = {
		a = { fg = "#61AFEF", bg = "transparent", gui = "bold" },
		-- a = { fg = "#282C34", bg = "#61AFEF", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
	insert = {
		a = { fg = "#98C379", bg = "transparent", gui = "bold" },
		-- a = { fg = "#282C34", bg = "#98C379", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
	command = {
		a = { fg = "#ff6e5e", bg = "transparent", gui = "bold" },
		b = { fg = "white", bg = "transparent" },
		c = { fg = "white", bg = "transparent" },
	},
}

local config = function()
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffAdd', {fg='#7aff73', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffChange', {fg='#ffef61', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffDelete', {fg='#ff5233', bg='#45475a'})

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					-- "mode",
					function()
						return "▊"
					end,
					-- color = { bg = "transparent", fg = "#a4b9f0" },
					padding = { left = 0, right = 1 },
				},
			},
			lualine_b = {
				{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
				{ "filename", color = { bg = "transparent", fg = "#9be0b9" }, padding = { left = 0, right = 1 } },
			},
			lualine_c = {
				{
					"branch",
					color = { bg = "transparent", fg = "#c391f2" },
				},
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					color = { bg = "transparent", fg = "white" },
				},
				{
					"diagnostics",
					color = { bg = "transparent", fg = "white" },
				},
			},
			lualine_x = {
				{
					function()
						if czs.display_results() then
							local target, current, count = czs.output()
							return string.format("/%s [%s/%s]", target, current, count)
						else
							return ""
						end
					end,
				},
			},
			lualine_y = {
				{
					"progress",
					color = { bg = "transparent", fg = "white" },
				},
				{ "location", color = { bg = "transparent", fg = "white" } },
			},
			lualine_z = {
				{
					function()
						return "▊"
					end,
					-- color = { bg = "transparent", fg = "#a4b9f0" },
					padding = { left = 1, right = 0 },
				},
			},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
