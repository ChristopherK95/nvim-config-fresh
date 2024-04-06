local opts = function()
	local wk = require("which-key")
	wk.register({
		f = {
			name = "Files",
			f = { "<cmd>FzfLua files<CR>", "find files" },
			g = { "<cmd>FzfLua live_grep<CR>", "live grep" },
			e = { "<cmd>Oil --float<CR>", "file explorer" },
			b = { "<cmd>FzfLua buffers<CR>", "buffers" },
			o = { "<cmd>FzfLua oldfiles<CR>", "recent files" },
			u = { ":UndotreeToggle<cr>", "undo tree" },
		},
		g = {
			name = "Git",
			b = { ":FzfLua git_branches<cr>", "branches" },
			s = { ":FzfLua git_status<cr>", "status" },
			f = { ":FzfLua git_bcommits<cr>", "file commits" },
			p = { ":Gitsigns preview_hunk_inline<cr>", "show changes" },
			g = { ":Gitsigns blame_line<cr>", "show git blame" },
		},
		d = {
			"Diagnostics",
			["<Right>"] = {
				function()
					vim.diagnostic.goto_next()
				end,
				"next",
			},
			["<Left>"] = {
				function()
					vim.diagnostic.goto_prev()
				end,
				"prev",
			},
		},
	}, { prefix = "<leader>" })
end

return {
	"folke/which-key.nvim",
	lazy = false,
	opts = opts,
}
