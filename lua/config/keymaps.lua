-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "hy", "<C-w>h")
vim.keymap.set("n", "hn", "<C-w>j")
vim.keymap.set("n", "he", "<C-w>k")
vim.keymap.set("n", "ho", "<C-w>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]])
vim.keymap.set("n", "<Leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<S-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<S-Up>", ":m .-2<CR>==")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<Leader>e", "<cmd>Oil<cr>")

-- ターミナル(insert)モードから直接ウィンドウ移動する
-- ノーマルモードの hy/hn/he/ho (C-w h/j/k/l) と同じ配置を Alt 付きで割り当てる。
-- Claude Code の TUI は M-b/M-f しか使わないため衝突しない。
vim.keymap.set("t", "<M-y>", [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set("t", "<M-n>", [[<C-\><C-n><C-w>j]], { desc = "Move to lower window" })
vim.keymap.set("t", "<M-e>", [[<C-\><C-n><C-w>k]], { desc = "Move to upper window" })
vim.keymap.set("t", "<M-o>", [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
