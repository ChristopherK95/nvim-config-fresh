return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    messages = { enabled = false },
    notify = { enabled = false },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
  },
}
