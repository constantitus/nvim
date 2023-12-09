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
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            -- Some extra keymaps for todo lists.
                            local leader = keybinds.leader
                            keybinds.remap_event("norg", "n", leader .. "-", "core.qol.todo_items.todo.task_pending")
                            keybinds.remap_event("norg", "n", leader .. "_", "core.qol.todo_items.todo.task_cancelled")
                            keybinds.remap_event("norg", "n", leader .. "x", "core.qol.todo_items.todo.task_done")
                            keybinds.remap_event("norg", "n", leader .. "<space>", "core.qol.todo_items.todo.task_undone")
                            keybinds.remap_event("norg", "n", leader .. "!", "core.qol.todo_items.todo.task_important")
                            keybinds.remap_event("norg", "n", leader .. "?", "core.qol.todo_items.todo.task_ambiguous")
                            keybinds.remap_event("norg", "n", leader .. "=", "core.qol.todo_items.todo.task_on_hold")
                            keybinds.remap_event("norg", "n", leader .. "+", "core.qol.todo_items.todo.task_recurring")
                        end,
                    }
                },
            },
        })
        vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
            pattern = {"*.norg"},
            command = "set conceallevel=3"
        })
    end,
}
