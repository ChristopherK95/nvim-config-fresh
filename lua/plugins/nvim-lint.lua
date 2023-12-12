return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    local table = {
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
      lua = 'luacheck',
    }

    lint.linter_by_ft = table

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' },
      {
        group = lint_augroup,
        callback = function()
            lint.try_lint(table[vim.bo.filetype])
        end
      })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'trigger linting for current file' })
  end,
}
