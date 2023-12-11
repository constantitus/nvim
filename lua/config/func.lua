-- global functions

-- transparency and colorscheme
function ColorMyPencils(color)
    color = color or "catppuccin-frappe"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "VertSplit",                 { fg = "#737ab8" })

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
    vim.api.nvim_set_hl(0, "SpecialKey", 			{ bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", 			{ bg = "none" })
end
ColorMyPencils()

-- toggle colorcolumn
vim.keymap.set("n", "<leader>nc", function() ToggleColorColumn() end)
function ToggleColorColumn()
    local value = vim.api.nvim_get_option_value("colorcolumn", {})
    if value == "" then
        vim.api.nvim_set_option_value("colorcolumn", "80", {})
    else
        vim.api.nvim_set_option_value("colorcolumn", "", {})
    end
end

P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

MOUSE = true
vim.keymap.set("n", "<leader>nm", function() ToggleMouse() end)
function ToggleMouse()
    local keys = {
        "<Left>",  "<C-Left>",  "<S-Left>",
        "<Right>", "<C-Right>", "<S-Right>",
        "<Up>",    "<C-Up>",    "<S-Up>",
        "<Down>",  "<C-Down>",  "<S-Down>",
    }
    local modes = {"n", "i", "x"}

    if MOUSE then
        vim.opt.mouse = ""
        for i = 1, #keys do
            vim.keymap.set(modes, keys[i], "<Nop>")
        end
    else
        vim.opt.mouse = "a"
        for i = 1, #keys do
            vim.keymap.set(modes, keys[i], keys[i])
        end
    end

    MOUSE = not MOUSE
end
-- disable mouse and arrows by default
ToggleMouse()
