require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "i", "v" }, "fj", "<ESC>")
map("i", "<C-BS>", "<c-w>")
map("n", "<leader>cp", ":<c-r>+")
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "move lines down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "move lines up" })
map({"n", "i", "v"}, "<C-;>", "<End>")
map({"n", "i", "v"}, "<C-\'>", "<Home>")
map("n", "<leader>in", ":e $MYVIMRC<CR>", { desc = "init file" })
map("n", "cd", ":cd %:p:h<CR>", { desc = "sync directory" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
