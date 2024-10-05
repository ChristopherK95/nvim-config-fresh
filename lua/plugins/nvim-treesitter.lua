local config = function()
	require("nvim-treesitter.configs").setup({
		indent = {
			enable = true,
		},
		ensure_installed = {
			"javascript",
			"typescript",
			"yaml",
			"json",
			"lua",
			"gitignore",
			"bash",
			"html",
			"css",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
	vim.filetype.add({
		pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
	})
	vim.filetype.add({
		pattern = { [".*/rofi/.*%.rasi"] = "rasi" },
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}
