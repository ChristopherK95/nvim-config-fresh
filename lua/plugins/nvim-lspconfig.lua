local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local on_attach = function(_, bufnr)
		print(bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "<C-d>", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

	-- Lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua/"] = true,
					},
				},
			},
		},
	})

	-- Typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"typescriptreact",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "git"),
	})

	-- JSON
	lspconfig.jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"json",
			"jsonc",
		},
	})

	-- CSS
	lspconfig.cssls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"css",
			"scss",
		},
	})

	-- local luacheck = require("efmls-configs.linters.luacheck")
	-- local stylua = require("efmls-configs.formatters.stylua")
	-- local eslint_d = require("efmls-configs.linters.eslint_d")
	-- local prettier_d = require("efmls-configs.formatters.prettier_d")
	--
	-- lspconfig.efm.setup({
	-- 	filetypes = {
	-- 		"lua",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 	},
	-- 	init_options = {
	-- 		documentFormatting = true,
	-- 		documentRangeFormatting = true,
	-- 		hover = true,
	-- 		documentSymbol = true,
	-- 		codeAction = true,
	-- 		completion = true,
	-- 	},
	-- 	settings = {
	-- 		languages = {
	-- 			lua = { luacheck, stylua },
	-- 			typescript = { eslint_d, prettier_d },
	-- 			typescriptreact = { eslint_d, prettier_d },
	-- 		},
	-- 	},
	-- })
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
