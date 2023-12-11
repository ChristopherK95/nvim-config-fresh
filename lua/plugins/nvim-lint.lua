return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linter_by_ft = {
      typescript = "eslint_d",
      typescriptreact = "eslint_d",
      lua = 'luacheck',
    }

    -- local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' },
      {
        -- group = lint_augroup,
        callback = function()
          local ft = vim.bo.filetype
          if ft == 'lua' then
            lint.try_lint('luacheck')
          else
            lint.try_lint('eslint_d')
          end
        end
      })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'trigger linting for current file' })
  end,
}
