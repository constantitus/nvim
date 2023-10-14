vim.keymap.set("n", "<leader>gs", "<cmd>tabnew<CR><cmd>0G<CR>")

vim.keymap.set("n", "<leader>ga", "<cmd>G add %<CR>")
vim.keymap.set("n", "<leader>gA", "<cmd>G add -A<CR>")

vim.keymap.set("n", "<leader>gc", ":G commit -m ''<left>")
vim.keymap.set("n", "<leader>gC", ":G commit -am ''<left>")
vim.keymap.set("n", "<leader>gS", ":G switch ''<left>")

vim.keymap.set("n", "<leader>gp", "<cmd>G push<CR>")
vim.keymap.set("n", "<leader>gP", ":G push ")

vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>")

vim.keymap.set("n", "<leader>gd", "<cmd>Gdiff<CR>")

vim.keymap.set("n", "<leader>g-", "<cmd>silent G stash<CR><cmd>e<CR>")
vim.keymap.set("n", "<leader>g=", "<cmd>silent G stash pop<CR><cmd>e<CR>")

