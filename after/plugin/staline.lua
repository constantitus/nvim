require('staline').setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        -- line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
        line_column = "[%l:%c] 並%p%% ",

        fg              = "#986fec",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "none",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 12, -- Shorten LSP client names.
        branch_symbol   = " ",
        cool_symbol     = " ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n  = "#181a23",
		i  = "#181a23",
		ic = "#181a23",
		c  = "#181a23",
		v  = "#181a23"
    },
    mode_icons = {
        n = "󰫻 ",
        i = "󱂈 ",
        ic = ' ',
        c = "󰫰 ",
        v = "󱂌 ",   -- etc..
    },
    sections = {
        left = {
            ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
			'right_sep', '-file_name', 'left_sep', ' ',
			'right_sep_double', '-branch', 'left_sep_double', ' ',
        },
        mid  = { 'lsp' },
        right = {
            'right_sep', '-cool_symbol', 'left_sep', ' ',
            ' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
            'right_sep_double', '-line_column', 'left_sep_double', ' ',
        },
    },
    inactive_sections = {
        left = { 'branch' },
        mid  = { 'file_name' },
        right = { 'line_column' }
    },
    special_table = {
        NvimTree = { 'NvimTree', ' ' },
        packer = { 'Packer',' ' },
        fugitive = { 'Git', '󰊢 ' },
        harpoon = { 'Harpoon', '󱡅 ' },
        telescope = { 'Telescope', ' ' },
        alpha = { 'N E O V I M', '' },
    },
    lsp_symbols = {
        Error=" ",
        Info=" ",
        Warn=" ",
        Hint="",
    },
}
