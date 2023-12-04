return {
    "tamton-aquib/staline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local function harpoon_marks()
            local marks = require("harpoon").get_mark_config().marks
            local buffer = vim.api.nvim_buf_get_name(0)
            local current = require("harpoon.mark").get_index_of(buffer)
            local keymaps = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
            -- local keymaps = {"H", "J", "K", "L"}
            local amount = 9
            if #marks < amount then
                amount = #marks
            end
            local str = "%#StlMarks#"
            for i = 1, amount do
                if i == current
                then
                    str = str .. "[%#StlMarkCurr#" .. keymaps[i] .. "%#StlMarks#]"
                else
                    str = str .. " " .. keymaps[i] .. " "
                end
            end
            if current == nil then
                str = str .. " %#StlMarkCurr#󰛣 "
            else
                str = str .. " %#StlMarkCurr#󰛢 "
            end

            return str
        end

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return " %#StlRecord#󰑊 %#StlMacro#@" .. recording_register
            end
        end

        require("staline").setup({
            defaults = {
                expand_null_ls              = false, -- This expands out all the null-ls sources to be shown
                left_separator              = "",
                right_separator             = "",
                full_path                   = false,
                -- line_column                 = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
                line_column                 = "%p%% 並%l:%c",

                fg                          = "#986fec", -- Foreground text color.
                bg                          = "none", -- Default background is transparent.
                inactive_color              = "#303030",
                inactive_bgcolor            = "none",
                true_colors                 = true, -- true lsp colors.
                font_active                 = "bold", -- "bold", "italic", "bold,italic", etc

                mod_symbol                  = " ",
                lsp_client_symbol           = " ",
                lsp_client_character_length = 12, -- Shorten LSP client names.
                branch_symbol               = " ",
                cool_symbol                 = " ", -- Change this to override default OS icon.
                null_ls_symbol              = "", -- A symbol to indicate that a source is coming from null-ls
            },
            mode_colors = {
                n           = "#04a5e5",
                i           = "#dd7878",
                ic          = "#dd7878",
                c           = "#fe640b",
                v           = "#8839ef",
                V           = "#7287fd",
                [""]      = "#7287fd",
                t           = "#99e699",
            },
            mode_icons = {
                n           = "󰄛 N", -- "󰫻 ",
                i           = "󰄛 I", -- "󱂈 ",
                ic          = "󰄛 Ic", -- " ",
                c           = "󰄛 C", -- "󰫰 ",
                v           = "󰄛 V", -- "󱂌 ",
                V           = "󰄛 V LINE", -- "󱂌 ",
                [""]      = "󰄛 V BLOCK", -- "󱂌 ",
                t           = "󰄛 TERM", -- "󱂌 ",
            },
            sections = {
                left  = {
                    " ", "right_sep", "mode", "left_sep", "  ",
                    { "StlFolders", "󰉋" }, { "StlFolders", "cwd" },
                    { "StlFolders",     "file_name" },
                    { "StlGit",         "branch" },
                    show_macro_recording,
                },
                mid   = { { "StlLspName", "lsp_name" } },
                right = {
                    "lsp",
                    -- { "StlLine",        "file_size" },
                    { "StlLine",        "line_column" },
                    harpoon_marks,
                },
            },
            inactive_sections = {
                left  = { "branch" },
                mid   = { "file_name" },
                right = { "line_column" }
            },
            special_table     = {
                NvimTree = { "NvimTree", " " },
                packer = { "Packer", " " },
                fugitive = { "Git", "󰊢 " },
                harpoon = { "Harpoon", "󱡅 " },
                telescope = { "Telescope", " " },
                alpha = { "N E O V I M", "" },
            },
            lsp_symbols = {
                Error = " ",
                Info = " ",
                Warn = " ",
                Hint = " ",
            },
            file_icons = {
                conf = " ", zig = " ", sp = "S",
            }
        })
        vim.opt.laststatus = 3

        -- staline colors
        vim.api.nvim_set_hl(0, "StlFolders",          { fg="#f0c6c6", bg="none" })
        vim.api.nvim_set_hl(0, "StlGit",              { fg="#fab387", bg="none" })
        vim.api.nvim_set_hl(0, "StlLspName",          { fg="#1e66f5", bg="none" })
        vim.api.nvim_set_hl(0, "StlLsp",              { fg="#c6d0f5", bg="none" })
        vim.api.nvim_set_hl(0, "StlLine",             { fg="#7287fd", bg="none" })
        vim.api.nvim_set_hl(0, "StlMarks",          { fg="#cba6f7", bg="none" })
        vim.api.nvim_set_hl(0, "StlMarkCurr",       { fg="#7287fd", bg="none" })
        vim.api.nvim_set_hl(0, "StlRecord",       { fg="#e78284", bg="none" })
        vim.api.nvim_set_hl(0, "StlMacro",       { fg="#f0c6c6", bg="none" })
        -- vim.api.nvim_set_hl(0, "StlCoolSymbol", { fg="#8839ef", bg="none" })
        -- vim.api.nvim_set_hl(0, "StlRed",        { fg="#d20f39", bg="none" })
    end,
}
