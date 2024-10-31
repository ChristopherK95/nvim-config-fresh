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
			accept = "<Enter>",
			show_documentation = "<Tab>",
			hide_documentation = "<Tab>",
		},
		windows = {
			autocomplete = {
				border = "single",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				border = "single",
			},
			signature_help = {
				border = "single",
			},
		},
		trigger = {
			signature_help = {
				enabled = true,
			},
		},
		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},

		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "normal",

		-- experimental auto-brackets support
		-- accept = { auto_brackets = { enabled = true } }

		-- experimental signature help support
		-- trigger = { signature_help = { enabled = true } }
	},
}
