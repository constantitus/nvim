return {
    "folke/noice.nvim",
    opts = {
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure
        -- to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function()
        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,
                command_palette = true,      -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = "50%"
                    }
                }
            }
        })
        require("notify").setup({
            background_colour = "#000000",
            render = "wrapped-compact",
            max_width = 60,
            stages = "fade",
        })
    end,
}
