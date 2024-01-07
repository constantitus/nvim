return {
    -- appearance --
    ----------------
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end,
        event = "VeryLazy",
    },
    {
        "catppuccin/nvim",
        config = function() vim.cmd("colorscheme catppuccin") end,
        lazy = false,
    },
    {
        'echasnovski/mini.cursorword',
        version = false,
        config = function() require("mini.cursorword").setup({ delay = 0 }) end,
        event = "VeryLazy",
    },
    -- utility --
    -------------
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("zen-mode").setup({
                window = {
                    -- width = 90,
                    options = {
                        number = false,
                        relativenumber = false,
                    }
                },
            })
        end,
    },
    {
        "ziontee113/color-picker.nvim",
        cmd = {
            "PickColor",
            "ConvertHEXandRGB",
            "ConvertHEXandHSL",
        },
        config = function()
            require("color-picker").setup({ -- for changing icons & mappings
                ["icons"] = { "ﱢ", "" },
                ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
                ["keymap"] = { -- mapping example:
                    ["U"] = "<Plug>ColorPickerSlider5Decrease",
                    ["O"] = "<Plug>ColorPickerSlider5Increase",
                },
            })
        end,
    },
    {
        "smoka7/hop.nvim",
        event = "VeryLazy",
        config = function()
            require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })
            local hop = require("hop")
            local directions = require("hop.hint").HintDirection
            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                hop.hint_char1({
                    direction = directions.AFTER_CURSOR,
                    current_line_only = false,
                    hint_offset = 0
                })
            end, { remap = true })
            vim.keymap.set({ "n", "v" }, "<leader>F", function()
                hop.hint_char1({
                    direction = directions.BEFORE_CURSOR,
                    current_line_only = false,
                    hint_offset = 0
                })
            end, { remap = true })
            vim.keymap.set({ "n", "v" }, "<leader><leader>", function()
                hop.hint_char1({
                    direction = { directions.BEFORE_CURSOR, directions.AFTER_CURSOR },
                    current_line_only = false,
                    hint_offset = 0
                })
            end, { remap = true })
        end,
    },
    {
        "stevearc/aerial.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("aerial").setup({
                layout = {
                    max_width = { 40, 0.2 },
                    width = nil,
                    min_width = 10,

                    default_direction = "prefer_left",
                    placement = "window",
                },
            })
            vim.keymap.set("n", "[a", "<cmd>AerialPrev<CR>")
            vim.keymap.set("n", "]a", "<cmd>AerialNext<CR>")
        end,
    },
    {
        "echasnovski/mini.align",
        version = false,
        event = "VeryLazy",
        config = function() require("mini.align").setup() end,
    },
    {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh",
        event = "VeryLazy",
        config = function()
            require('tabnine').setup({
                disable_auto_comment=true,
                accept_keymap="<S-CR>", -- "<CR>",
                -- dismiss_keymap = "",
                debounce_ms = 800,
                suggestion_color = {gui = "#808080", cterm = 244},
                exclude_filetypes = {"TelescopePrompt", "oil", "response"},
                log_file_path = nil, -- absolute path to Tabnine log file
            })

            vim.api.nvim_set_hl(0, "TabnineSuggestion", {fg = "#808080"})
            vim.keymap.set("n", "<leader>Tt", "<Cmd>TabnineToggle<CR>")
        end,
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = {
                extra = false,
            },
        },
        event = "VeryLazy",
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function() require("trouble").setup() end,
    },
    -- navigation --
    ----------------
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "Gwrite", "Gread", "Gdiff", "Gvdiff" },
        keys = {{ "<leader>gd", "<Cmd>Gvdiff<CR>" }},
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "theprimeagen/git-worktree.nvim",
    },

    -- meme --
    ----------
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton" }
    },
}
