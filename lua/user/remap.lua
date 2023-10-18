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

-- Case-insensitive search
vim.keymap.set("n", "<C-/>", "/\\c")
vim.keymap.set("n", "<C-?>", "?\\c")

-- centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- resize split
vim.keymap.set("n", "<C-_>", "<cmd>resize -3<CR>")
vim.keymap.set("n", "<C-+>", "<cmd>resize +3<CR>")

-- disables
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>") -- fuck that

-- cnext/cprev
vim.keymap.set("n", "]c", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[c", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")

-- commands
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>wr", "<cmd>set wrap!<cr>")

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)

-- tree
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<cr>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- trouble
vim.keymap.set("n", "<leader>qf", "<cmd>TroubleToggle quickfix<cr>",
    {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>er", "<cmd>TroubleToggle document_diagnostics<cr>",
    {silent = true, noremap = true}
)

-- zenmode
vim.keymap.set("n", "<leader>zz", "<cmd>lua ZenToggle()<CR><cmd>IBLToggle<CR>" )


-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set( {'n', 'v'}, '<leader>f', function()
    hop.hint_char1({
        direction = directions.AFTER_CURSOR,
        current_line_only = false,
        hint_offset = 0
    })
end, {remap=true})
vim.keymap.set( {'n', 'v'}, '<leader>F', function()
    hop.hint_char1({
        direction = directions.BEFORE_CURSOR,
        current_line_only = false,
        hint_offset = 0
    })
end, {remap=true})
vim.keymap.set( {'n', 'v'}, '<leader><leader>', function()
    hop.hint_char1({
        direction = { directions.BEFORE_CURSOR, directions.AFTER_CURSOR},
        current_line_only = false,
        hint_offset = 0
    })
end, {remap=true})

-- git
vim.keymap.set("n", "<leader>gs", "<cmd>tabnew<CR><cmd>0G<CR>")
vim.keymap.set("n", "<leader>ga", "<cmd>G add %<CR>")
vim.keymap.set("n", "<leader>gA", "<cmd>G add -A<CR>")
vim.keymap.set("n", "<leader>gc", ":G commit -m ''<left>")
vim.keymap.set("n", "<leader>gC", ":G checkout")
vim.keymap.set("n", "<leader>gS", ":G switch ''<left>")
vim.keymap.set("n", "<leader>gp", "<cmd>G push<CR>")
vim.keymap.set("n", "<leader>gP", ":G push ")
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiff<CR>")
vim.keymap.set("n", "<leader>g-", "<cmd>silent G stash<CR><cmd>e<CR>")
vim.keymap.set("n", "<leader>g=", "<cmd>silent G stash pop<CR><cmd>e<CR>")

-- Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- other plugins

vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>", { noremap = true, silent = true })
-- vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

vim.keymap.set('n', '<leader>Cw', '<cmd>CursorWordToggle<CR>')


