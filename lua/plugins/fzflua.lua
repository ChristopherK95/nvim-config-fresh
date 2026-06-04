return {
  "ibhagwan/fzf-lua",
  lazy = false,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      defaults = {
        formatter = "path.filename_first",
      },
      winopts = {
        preview = {
          border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
          layout = "horizontal",
          horizontal = "right:50%",
        },
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        row = 1,
        width = 1,
        height = 0.85
      },
      previewers = {
        builtin = {
          extensions = {
            ["png"] = { "chafa", "--colors=full", "--color-extractor=average", "--symbols=block+border+extra", "{file}" },
            ["jpg"] = { "chafa", "--colors=full", "--color-extractor=average", "--symbols=block+border+extra", "{file}" },
            ["jpeg"] = { "chafa", "--colors=full", "--color-extractor=average", "--symbols=block+border+extra", "{file}" },
            ["gif"] = { "chafa", "--colors=full", "--color-extractor=average", "--symbols=block+border+extra", "{file}" },
            ["webp"] = { "chafa", "--colors=full", "--color-extractor=average", "--symbols=block+border+extra", "{file}" },
          },
        },
      },
      -- fzf_opts = {
      -- 	["--pointer"] = " ",
      -- },
      fzf_colors = {
        -- ["pointer"] = { "fg", "FzfLuaColorsPointer" },
        ["pointer"] = "-1",
        ["bg"] = { "bg", "FzfLuaColorsBg" },
        ["bg+"] = { "bg", "FzfLuaColorsBgSel" },
        ["fg"] = { "fg", "FzfLuaColorsFg" },
        ["fg+"] = { "fg", "FzfLuaColorsFgSel" },
        -- ["gutter"] = { "bg", "Normal" },
        ["gutter"] = "-1",
        ["prompt"] = { "fg", "FzfLuaColorsPrompt" },
      },
      files = {
        prompt = "Files ❯ ",
        cwd_prompt = false,
        winopts = {
          title = { { " " .. "Files" .. " ", "FzfLuaTitle" } },
          title_pos = "center",
        },
        fd_opts = "--color never --type f --hidden --follow --exclude node_modules --exclude build/ --exclude .git",
      },
      grep = {
        rg_opts = "--sort-files --hidden --column --line-number --no-heading "
            .. "--color=always --smart-case -g '!{.git,node_modules,build}/'",
      },
    })
  end,
}
