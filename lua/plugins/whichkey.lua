local keys = {
	{ "<leader>d", desc = "Diagnostics" },
	{
		"<leader>d<Left>",
		function()
			vim.diagnostic.goto_prev()
		end,
		desc = "prev",
	},
	{
		"<leader>d<Right>",
		function()
			vim.diagnostic.goto_next()
		end,
		desc = "next",
	},
	{ "<leader>f", group = "Files" },
	{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "buffers" },
	{ "<leader>fe", "<cmd>Oil --float<CR>", desc = "file explorer" },
	{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "find files" },
	{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "live grep" },
	{ "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "recent files" },
	{ "<leader>fu", ":UndotreeToggle<cr>", desc = "undo tree" },
	{ "<leader>g", group = "Git" },
	{ "<leader>gb", ":FzfLua git_branches<cr>", desc = "branches" },
	{ "<leader>gf", ":FzfLua git_bcommits<cr>", desc = "file commits" },
	{ "<leader>gg", ":Gitsigns blame_line<cr>", desc = "show git blame" },
	{ "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", desc = "show changes" },
	{ "<leader>gs", ":FzfLua git_status<cr>", desc = "status" },
	{ "<leader>l", group = "Lsp" },
	{ "<leader>q", ":q<CR>", desc = "Quit" },
	{ "<leader>w", desc = "Window splits" },
	{ "<leader>wh", ":split<CR>", desc = "h-split" },
	{ "<leader>wv", ":vsplit<CR>", desc = "v-split" },
}

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = keys,
		win = {
			border = "single",
		},
	},
}
