function ZenToggle()
    require("zen-mode").setup {
        window = {
            -- width = 90,
            options = {
                number = false,
                relativenumber = false,
            }
        },
    }
    require("zen-mode").toggle()
end

vim.keymap.set("n", "<leader>zz", "<cmd>lua ZenToggle()<CR><cmd>IBLToggle<CR>" )

