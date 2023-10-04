-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- disabling the mouse and the arrows
vim.opt.mouse = ""
vim.keymap.set({'n', 'i', 'x'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<Right>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<DOwn>', '<Nop>')
require("user")

