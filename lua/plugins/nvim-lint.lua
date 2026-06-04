return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    local table = {
      -- javascript = "eslint_d",
      -- javascriptreact = "eslint_d",
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
      lua = "luacheck",
      json = "jsonlint",
    }


    lint.linters.eslint_d.args = {
      "--no-warn-ignored",
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    lint.linter_by_ft = table

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(table[vim.bo.filetype])
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      local get_clients = vim.lsp.get_clients
      local client = get_clients({ bufnr = 0 })[1]
      print(client.root_dir)
      -- print(vim.lsp.get_clients({ bufnr = 0 })[1].root_dir)
      lint.try_lint(nil, { cwd = client.root_dir })
    end, { desc = "trigger linting for current file" })
  end,
}
