local czs = require("czs")

local theme = {
	inactive = {
		a = { fg = "#d3c6aa", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
	visual = {
		a = { fg = "#d699b6", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
	replace = {
		a = { fg = "#e69875", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
	normal = {
		a = { fg = "#7fbbb3", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
	insert = {
		a = { fg = "#a7c080", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
	command = {
		a = { fg = "#e67e80", bg = "transparent", gui = "bold" },
		b = { fg = "#d3c6aa", bg = "transparent" },
		c = { fg = "#d3c6aa", bg = "transparent" },
	},
}

local diff_source = function()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
	end
end

local config = function()
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffAdd', {fg='#7aff73', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffChange', {fg='#ffef61', bg='#45475a'})
	-- vim.api.nvim_set_hl(0, 'LuaLineDiffDelete', {fg='#ff5233', bg='#45475a'})

	require("lualine").setup({
		options = {
			theme = theme,
			globalstatus = false,
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
				{ "filename", color = { bg = "transparent", fg = "#d3c6aa" }, padding = { left = 0, right = 1 } },
			},
			lualine_c = {
				{
					"diff",
					source = diff_source,
					symbols = { added = " ", modified = " ", removed = " " },
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
				{
					"diagnostics",
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
			},
			lualine_x = {},
			lualine_y = {
				{
					function()
						if czs.display_results() then
							local target, current, count = czs.output()
							return string.format("/%s [%s/%s]", target, current, count)
						else
							return ""
						end
					end,
					color = { fg = "#d3c6aa" },
				},
			},
			lualine_z = {
				{
					"progress",
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
				{
					"location",
					color = { bg = "#e67e80", fg = "#272e33", gui = "bold" },
					fmt = function(str)
						return " " .. str
					end,
				},
			},
			-- lualine_z = {
			-- 	{
			-- 		function()
			-- 			return ""
			-- 		end,
			-- 		color = { bg = "#e68da5", fg = "white" },
			-- 		padding = { left = 1, right = 0 },
			-- 	},
			-- },
		},
		inactive_sections = {
			lualine_a = {
				{
					function()
						return " "
					end,
					padding = { left = 0, right = 1 },
				},
			},
			lualine_b = {
				{ "filetype", icon_only = true, padding = { left = 1, right = 0 } },
				{ "filename", color = { bg = "transparent", fg = "#d3c6aa" }, padding = { left = 0, right = 1 } },
			},
			lualine_c = {
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
					source = diff_source,
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
				{
					"diagnostics",
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{
					"progress",
					color = { bg = "transparent", fg = "#d3c6aa" },
				},
				{
					"location",
					color = { bg = "#e67e80", fg = "#272e33", gui = "bold" },
					fmt = function(str)
						return " "  .. str
					end,
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
