---@diagnostic disable: undefined-doc-name
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    lazygit = { enabled = true },
  },
}
