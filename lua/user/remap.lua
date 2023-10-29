-- set <leader> to space
vim.g.mapleader = " "


-- left and right for command mode
vim.keymap.set({ "c", "t" }, "<C-h>", "<left>")
vim.keymap.set({ "c", "t" }, "<C-l>", "<right>")

-- word into substitute
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- selection into substitute
vim.keymap.set("v", "<leader>s", [["qy:%s/<C-r>q//gI<left><left><left>]])

-- moving selected items with J K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- J leeps your cursor location
vim.keymap.set("n", "J", "mzJ`z")

-- Paste without yanking
vim.keymap.set("x", "<leader>P", [["_dP]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>X", [["_x]])

-- Yank into +
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>x", [["+x]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Case-insensitive search
vim.keymap.set("n", "<C-/>", [[/\c]])
vim.keymap.set("n", "<C-?>", [[?\c]])

-- centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- resize split
vim.keymap.set("n", "<C-_>", "<cmd>resize -3<CR>")
vim.keymap.set("n", "<C-+>", "<cmd>resize +3<CR>")

-- disables
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>") -- fuck that

-- next/prev
vim.keymap.set("n", "]a", "<cmd>next<CR>zz")
vim.keymap.set("n", "[a", "<cmd>prev<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]b", "<cmd>bnext<CR>zz")
vim.keymap.set("n", "[b", "<cmd>bprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")

-- commands
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>wr", "<cmd>set wrap!<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>set hlsearch!<CR>")

-- undotree
vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")

-- tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")

-- trouble
local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>Eq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.keymap.set("n", "<leader>Er", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>Ew", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>El", "<cmd>TroubleToggle loclist<cr>", opts)
vim.keymap.set("n", "<leader>EL", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- zenmode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR><cmd>IBLToggle<CR>")

-- dap
vim.keymap.set("n", "<leader>dt", function() require('dapui').toggle() end)
vim.keymap.set("n", "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", {noremap=true})
vim.keymap.set("n", "<leader>dc", "<Cmd>DapContinue<CR>", {noremap=true})
vim.keymap.set("n", "<leader>dr", function() require('dapui').open({reset = true}) end)

-- git
vim.keymap.set("n", "<leader>gs", "<cmd>tab G<CR>") -- I'm used to <leader>gs
vim.keymap.set("n", "<leader>gg", "<cmd>tab G<CR>") -- I should use this over <Leader>gs
vim.keymap.set("n", "<leader>ga", "<cmd>G add %<CR>")
vim.keymap.set("n", "<leader>gA", "<cmd>G add -A<CR>")
vim.keymap.set("n", "<leader>gc", ":G commit -m ''<left>")
vim.keymap.set("n", "<leader>gC", ":G checkout")
vim.keymap.set("n", "<leader>gS", ":G switch ''<left>")
vim.keymap.set("n", "<leader>gp", ":G push ") -- borked in noice cmdline
vim.keymap.set("n", "<leader>gP", ":G pull")
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>")
vim.keymap.set("n", "<leader>gR", ":G rebase -i ")
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiff<CR>")
vim.keymap.set("n", "<leader>g-", "<cmd>silent G stash<CR><cmd>e<CR>")
vim.keymap.set("n", "<leader>g=", "<cmd>silent G stash pop<CR><cmd>e<CR>")

-- notify
vim.keymap.set("n", "<leader>N", "<cmd>Telescope notify<CR>")

-- lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- other plugins

vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

vim.keymap.set("n", "<leader>Cw", "<cmd>CursorWordToggle<CR>")

vim.keymap.set("n", "<leader>A", "<cmd>AerialToggle!<CR>")

vim.keymap.set("n", "<C-\\>", "<Cmd>ToggleTerm<CR>")
vim.keymap.set("v", "<C-\\>", "<Cmd>ToggleTermSendVisualSelection<CR>")
