return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },
    win_options = {
      wrap = false,
      signcolumn = "no",
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
      winbar = "%{v:lua.require('oil').get_current_dir()}",
    },
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      is_always_hidden = function(name, bufnr)
        return false
      end,
    },
    float = {
      padding = 2,
      -- max_width = 90,
      max_height = 0,
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
