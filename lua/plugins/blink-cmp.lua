return {
	"saghen/blink.cmp",
	enabled = true,
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "v0.*",
	-- OR build from source, requires nightly:
	--  https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',

	opts = {
		keymap = {
			preset = "enter",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      -- ['<Tab>'] = {'snippet_forward'},
      -- ['<S-Tab>'] = {'snippet_backward'}
			-- accept = "<Enter>",
			-- show_documentation = "<Tab>",
			-- hide_documentation = "<Tab>",
		},
		completion = {
			list = {
				selection = { preselect = false },
			},
			menu = {
				border = "none",
        auto_show = function (ctx)
          return ctx.mode ~= 'cmdline'
        end
			},
			documentation = {
				auto_show_delay_ms = 100,
				auto_show = true,
				window = {
					border = "none",
				},
			},
		},
	},
}
