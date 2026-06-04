return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Install parsers (async, no-op if already installed)
    require("nvim-treesitter").install({
      "javascript",
      "jsx",
      "typescript",
      "tsx",
      "yaml",
      "json",
      "lua",
      "gitignore",
      "bash",
      "html",
      "css",
      "styled",
      "markdown",
      "markdown_inline",
    })

    -- Enable treesitter highlighting for all filetypes that have a parser
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    vim.filetype.add({
      pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    })
    vim.filetype.add({
      pattern = { [".*/rofi/.*%.rasi"] = "rasi" },
    })
  end,
}
