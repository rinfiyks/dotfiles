vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<Enter>", "<Return>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set({ "i", "s" }, "<C-j>", function() vim.snippet.jump(1) end)
vim.keymap.set({ "i", "s" }, "<C-k>", function() vim.snippet.jump(-1) end)

vim.keymap.set({ "n", "v" }, "x", "\"_x")
vim.keymap.set({ "n", "v" }, "X", "\"_X")
vim.keymap.set({ "n", "v" }, "c", "\"_c")
vim.keymap.set({ "n", "v" }, "C", "\"_C")

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")
