local config = function()
  require('nvim-treesitter.configs').setup({
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      'javascript',
      'typescript',
      'json',
      'lua',
      'gitignore',
      'bash',
      'html',
      'css',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  config = config
}
