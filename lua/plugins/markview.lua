return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = { "saghen/blink.cmp" },
  config = function(_, opts)
    require("markview").setup(opts or {})

    -- Lspsaga sets `filetype='markdown'` before `buftype='nofile'` on hover floats,
    -- causing markview to attach before it can check ignore_buftypes. Detach after
    -- all options are set by scheduling cleanup on each markdown FileType event.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(args)
        local buf = args.buf
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(buf) then return end

          local is_nofile = vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile"
          local is_float = false
          for _, win in ipairs(vim.fn.win_findbuf(buf)) do
            if vim.api.nvim_win_get_config(win).relative ~= "" then
              is_float = true
              break
            end
          end

          if is_nofile or is_float then
            local ok, state = pcall(require, "markview.state")
            if ok and state.buf_attached(buf) then
              pcall(require("markview.actions").detach, buf)
            end
          end
        end)
      end,
    })
  end,
}
