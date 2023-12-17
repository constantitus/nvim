-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- you need to set mapleader before starting lazy, blah blah
vim.g.mapleader = " "

require("config.lazy")
require("config.remap")
require("config.set")
require("config.func")
