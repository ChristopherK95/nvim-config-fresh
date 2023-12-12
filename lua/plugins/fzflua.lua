return {
	"ibhagwan/fzf-lua",
  lazy = false,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			file_ignore_patterns = { "%.svg$" },
			winopts = {
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			},
			fzf_opts = {
				["--pointer"] = "❯",
			},
			fzf_colors = {
				["pointer"] = { "fg", "FzfLuaColorsPointer" },
				["bg"] = { "bg", "FzfLuaColorsBg" },
				["bg+"] = { "bg", "FzfLuaColorsBgSel" },
				["fg"] = { "fg", "FzfLuaColorsFg" },
				["fg+"] = { "fg", "FzfLuaColorsFgSel" },
				["gutter"] = { "bg", "Normal" },
				["prompt"] = { "fg", "FzfLuaColorsPrompt" },
			},
			files = {
				prompt = "Files ❯ ",
        cwd_prompt = false,
				winopts = {
					title = { { " " .. "Files" .. " ", "FzfLuaTitle" } },
					title_pos = "center",
				},
			},
			grep = {
				rg_opts = "--sort-files --hidden --column --line-number --no-heading "
					.. "--color=always --smart-case -g '!{.git,node_modules}/*'",
			},
		})
	end,
}
