local config = function()
	local status_ok, wk = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local setup = {
		window = {
			border = "single",
		},
	}

	local mappings = {
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
		l = {
			name = "Lsp",
			h = {
				function()
					local enabled = vim.lsp.inlay_hint.is_enabled({})
					vim.lsp.inlay_hint.enable(not enabled)
				end,
				"toggle inlay hints",
			},
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
		w = {
			"Window splits",
			h = { ":split<CR>", "h-split" },
			v = { ":vsplit<CR>", "v-split" },
		},
		q = { ":q<CR>", "Quit" },
	}

	local opts = { prefix = "<leader>" }

	wk.setup(setup)
	wk.register(mappings, opts)
end

return {
	"folke/which-key.nvim",
	lazy = false,
	config = config,
}
