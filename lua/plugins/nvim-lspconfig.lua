local config = function()
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = " ",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
  })

  vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
    vim.lsp.handlers.hover(err, result, ctx, vim.tbl_deep_extend("force", config or {}, { border = "single" }))
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
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
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    end,
  })

  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })

  -- Lua
  vim.lsp.config("lua_ls", {
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

  -- TypeScript/JavaScript
  -- Custom root_dir to scope ts_ls to client/ or server/ subdirectories in monorepos,
  -- so that plugins like @styled/typescript-styled-plugin resolve from the right node_modules.
  local function find_ts_root_dir(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local current_dir = vim.fn.fnamemodify(fname, ':p:h')
    local cwd = vim.uv.cwd()

    local function find_root_with_markers(start_path, markers)
      local path = start_path
      while path and path ~= '/' do
        for _, marker in ipairs(markers) do
          if vim.fn.filereadable(path .. '/' .. marker) == 1
            or vim.fn.isdirectory(path .. '/' .. marker) == 1
          then
            return path
          end
        end
        path = vim.fn.fnamemodify(path, ':h')
      end
      return nil
    end

    if string.match(current_dir, '/client') then
      local client_root = current_dir:match('(.*/client)')
      if client_root and vim.fn.filereadable(client_root .. '/package.json') == 1 then
        return on_dir(client_root)
      end
    elseif string.match(current_dir, '/server') then
      local server_root = current_dir:match('(.*/server)')
      if server_root and vim.fn.filereadable(server_root .. '/package.json') == 1 then
        return on_dir(server_root)
      end
    end

    local root = find_root_with_markers(current_dir, { 'package.json', 'tsconfig.json', '.git' })
    return on_dir(root or cwd)
  end

  vim.lsp.config("ts_ls", {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    root_dir = find_ts_root_dir,
  })

  -- JSON
  vim.lsp.config("jsonls", {
    filetypes = { "json", "jsonc" },
  })

  -- CSS
  vim.lsp.config("cssls", {
    filetypes = { "css", "scss" },
  })

  -- Bash
  vim.lsp.config("bashls", {
    filetypes = { "sh" },
  })

  vim.lsp.enable({ "lua_ls", "ts_ls", "jsonls", "cssls", "bashls" })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
  },
}
