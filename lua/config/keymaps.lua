local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>GuardFmt<CR>", { noremap = false })

-- Window maneuver
vim.api.nvim_set_keymap("n", "<C-left>", "<C-w><left>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-right>", "<C-w><right>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-up>", "<C-w><up>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-down>", "<C-w><down>", { silent = true })

vim.keymap.set("n", "<A-Up>", ":m -2<cr>")
vim.keymap.set("n", "<A-Down>", ":m +1<cr>")

vim.keymap.set("x", "<Space>p", '"_dP')
vim.keymap.set("n", "<Space>y", '"+y')
vim.keymap.set("v", "<Space>y", '"+y')
vim.keymap.set("n", "<Space>Y", '"+Y')

-- Maneuver quickfix list
vim.keymap.set("n", "<C-[>", "<cmd>cp<CR>")
vim.keymap.set("n", "<C-]>", "<cmd>cn<CR>")

vim.keymap.set("i", "<C-c>", "<Esc>")
