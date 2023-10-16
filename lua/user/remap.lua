-- set <leader> to space
vim.g.mapleader = " "


-- word into substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- selection into substitute
vim.keymap.set("v", "<leader>s", [["qy:%s/<C-r>q//g<left><left>]])

-- moving selected items with J K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J leeps your cursor location
vim.keymap.set("n", "J", "mzJ`z")

-- Paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Yank into +
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>x", [["+x]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-_>", "<cmd>resize -3<CR>")
vim.keymap.set("n", "<C-+>", "<cmd>resize +3<CR>")

-- disables
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>") -- fuck that

vim.keymap.set("n", "]c", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[c", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")

-- commands
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>wr", "<cmd>set wrap!<cr>")
