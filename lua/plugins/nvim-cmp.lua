local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip/loaders/from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "single",
					side_padding = 1,
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
				},
				documentation = {
					border = "single",
					side_padding = 1,
					winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Up>"] = cmp.mapping.select_prev_item(),
				["<C-Down>"] = cmp.mapping.select_next_item(),
				["<PageUp>"] = cmp.mapping.scroll_docs(-4),
				["<PageDown>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				fields = { "abbr", "kind" },
				format = function(_, vim_item)
					vim_item.abbr = vim_item.abbr
					vim_item.kind = (kind_icons[vim_item.kind] or "Foo") .. " " .. (vim_item.kind or "")
					return vim_item
				end,
			},
		})
	end,
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-path" },
		"onsails/lspkind.nvim",
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
		},
	},
}
