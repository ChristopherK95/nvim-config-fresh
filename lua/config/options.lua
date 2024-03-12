local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.pumheight = 15

-- Behavior
opt.hidden = true
opt.errorbells = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor = "n-v-c-i:block"
opt.encoding = "UTF-8"

vim.diagnostic.config({ virtual_text = false })
vim.diagnostic.config({ update_in_insert = true })

vim.cmd("command! W w")
vim.cmd("command! Q q")
vim.cmd("command! Qa qa")
