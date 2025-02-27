local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
	}

	local on_attach = function(_, bufnr)
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
		vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", opts)
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
		vim.keymap.set("n", "<C-d>", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
		-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.lsp.inlay_hint.enable(false)
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

	lspconfig.gdscript.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
	})

	-- Odin
	lspconfig.ols.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		filetypes = {
			"odin",
		},
	})

	-- Zig
	lspconfig.zls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		filetypes = {
			"zig",
		},
	})

	-- Go
	lspconfig.gopls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		settings = {
			gopls = {
				["ui.inlayhint.hints"] = {
					compositeLiteralFields = true,
					constantValues = true,
					parameterNames = true,
				},
			},
		},
		filetypes = {
			"go",
		},
	})

	-- Rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		root_dir = function()
			return vim.fn.getcwd()
		end,
	})

	-- Lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = handlers,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
					disable = { "missing-parameters", "missing-fields" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.stdpath("config") .. "nvim/lua/",
					},
				},
			},
		},
	})

	-- lspconfig.vtsls.setup({
	-- 	on_attach = on_attach,
	-- 	capabilities = capabilities,
	-- 	handlers = handlers,
	-- 	filetypes = {
	-- 		"javascript",
	-- 		"javascriptreact",
	-- 		"typescript",
	-- 		"typescriptreact",
	-- 	},
	-- 	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "git"),
	-- })

	lspconfig.eslint.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
		cmd = { "vscode-eslint-language-server", "--stdio" },
		filetypes = {
			"typescript",
			"typescriptreact",
		},
		settings = {
			workingDirectory = { mode = "auto" },
			lint = { enable = true },
		},
		root_dir = lspconfig.util.root_pattern(".eslintrc", "package.json"),
	})

	-- Typescript/Javascript
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = handlers,
		filetypes = {
			"javascript",
			"javascriptreact",
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

	-- C
	lspconfig.clangd.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"c",
			"c++",
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

	-- Bash
	lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"sh",
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
