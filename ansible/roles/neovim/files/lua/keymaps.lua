--  _   __ _______   ____  ___  ___  ______  _____ 
-- | | / /|  ___\ \ / /  \/  | / _ \ | ___ \/  ___|
-- | |/ / | |__  \ V /| .  . |/ /_\ \| |_/ /\ `--. 
-- |    \ |  __|  \ / | |\/| ||  _  ||  __/  `--. \
-- | |\  \| |___  | | | |  | || | | || |    /\__/ /
-- \_| \_/\____/  \_/ \_|  |_/\_| |_/\_|    \____/ 
--


vim.g.mapleader = ";"

vim.keymap.set({ "n" }, "<leader>u", vim.cmd.update, { desc = "Like :write but only when the buffer has been modified." })
vim.keymap.set({ "n" }, "<leader>e", vim.cmd.Explore, { desc = "Explore directory of the current file." })

vim.keymap.set({ "i" }, '"', '""<left>', { desc = "Add matching closing character." })
vim.keymap.set({ "i" }, "(", "()<left>", { desc = "Add matching closing character." })
vim.keymap.set({ "i" }, "[", "[]<left>", { desc = "Add matching closing character." })
vim.keymap.set({ "i" }, "{", "{}<left>", { desc = "Add matching closing character." })

vim.keymap.set({ "n" }, "<up>", "<cmd>resize -2<cr>", { desc = "Decrease current window height by 2." })
vim.keymap.set({ "n" }, "<down>", "<cmd>resize +2<cr>", { desc = "Increase current window height by 2." })
vim.keymap.set({ "n" }, "<right>", "<cmd>vertical resize +2<cr>", { desc = "Increase current window width by 2." })
vim.keymap.set({ "n" }, "<left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease current window width by 2." })

vim.keymap.set({ "n" }, "<leader>k", "<cmd>lnext<cr>zz", { desc = "Go to next item in the location list." })
vim.keymap.set({ "n" }, "<leader>j", "<cmd>lprev<cr>zz", { desc = "Go to the previous item in the location list." })
vim.keymap.set({ "n" }, "<leader>K", "<cmd>cnext<cr>zz", { desc = "Go to next item in the quickfix list." })
vim.keymap.set({ "n" }, "<leader>J", "<cmd>cprev<cr>zz", { desc = "Go to previous item in the quickfix list." })
