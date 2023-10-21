-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disabling the mouse and the arrows
vim.opt.mouse = ""

vim.keymap.set({'n', 'i', 'x'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<Right>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<DOwn>', '<Nop>')

vim.keymap.set({'n', 'i', 'x'}, '<C-Left>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<C-Right>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<C-Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<C-DOwn>', '<Nop>')

vim.keymap.set({'n', 'i', 'x'}, '<S-Left>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<S-Right>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<S-Up>', '<Nop>')
vim.keymap.set({'n', 'i', 'x'}, '<S-DOwn>', '<Nop>')

vim.opt.termguicolors = true

require("user")
