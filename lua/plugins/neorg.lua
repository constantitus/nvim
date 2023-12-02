return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {
                    config = {
                        icons = {
                            code_block = {
                                conceal = true,
                            }
                        }
                    }
                }, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
                ["core.keybinds"] = {},
            },
        })
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = {"*.norg"},
            command = "set conceallevel=3"
        })
    end,
}
