vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes:1"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

function ColorMyPencils(color)
    color = color or "catppuccin-frappe"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", 				{ bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", 			{ bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", 		{ bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", 	{ bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", 		{ bg = "none" })
    vim.api.nvim_set_hl(0, "TroubleNormal", 		{ bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", 		{ bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", 		{ bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", 				{ bg = "none" })
    vim.api.nvim_set_hl(0, "NormalSB", 				{ bg = "none" })
    vim.api.nvim_set_hl(0, "Folded", 				{ link="Directory" })
    vim.api.nvim_set_hl(0, "NonText", 				{ bg = "none" })
    vim.api.nvim_set_hl(0, "SpecialKey", 			{ bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", 			{ bg = "none" })
end

ColorMyPencils()

-- staline colors
vim.api.nvim_set_hl(0, "StlFolders",    { fg="#f0c6c6" , bg="none" })
vim.api.nvim_set_hl(0, "StlGit",        { fg="#fab387" ,bg="none" })
vim.api.nvim_set_hl(0, "StlLspName",    { fg="#1e66f5" , bg="none" })
vim.api.nvim_set_hl(0, "StlLsp",        { fg="#c6d0f5" ,bg="none" })
vim.api.nvim_set_hl(0, "StlLine",       { fg="#7287fd" ,bg="none" })
vim.api.nvim_set_hl(0, "StlHarpoon",       { fg="#cba6f7" ,bg="none" })
-- vim.api.nvim_set_hl(0, "StlCoolSymbol", { fg="#8839ef" , bg="none" })
-- vim.api.nvim_set_hl(0, "StlRed",        { fg="#d20f39" ,bg="none" })
