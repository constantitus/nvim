require("staline").setup {
    defaults = {
        expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
        left_separator  = "",
        right_separator = "",
        full_path       = false,
        -- line_column     = "[%l/%L] :%c 並%p%% ", -- `:h stl` to see all flags.
        line_column = "%p%% 並%l:%c ",

        fg              = "#986fec",  -- Foreground text color.
        bg              = "none",     -- Default background is transparent.
        inactive_color  = "#303030",
        inactive_bgcolor = "none",
        true_colors     = false,      -- true lsp colors.
        font_active     = "bold",     -- "bold", "italic", "bold,italic", etc

        mod_symbol      = "  ",
        lsp_client_symbol = " ",
        lsp_client_character_length = 12, -- Shorten LSP client names.
        branch_symbol   = " ",
        cool_symbol     = "   ",       -- Change this to override default OS icon.
        null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
    },
    mode_colors = {
        n       = "#04a5e5",
		i       = "#dd7878",
		ic      = "#dd7878",
		c       = "#fe640b",
		v       = "#8839ef",
		V       = "#7287fd",
		['']  = "#7287fd",
		t       = "#99e699",
    },
    mode_icons  = {
        n       = '󱇪 N',-- "󰫻 ",
        i       = '󱇪 I',-- "󱂈 ",
        ic      = '󱇪 Ic',-- ' ',
        c       = '󱇪 C',-- "󰫰 ",
        v       = '󱇪 V',-- "󱂌 ",
        V       = '󱇪 V LINE',-- "󱂌 ",
        ['']  = '󱇪 V BLOCK',-- "󱂌 ",
        t       = '󱇪 TERM',-- "󱂌 ",
    },
    sections = {
        left = {
            ' ', 'right_sep', 'mode', 'left_sep', '  ',
			{ 'StlFolders', '󰉋 ' }, { 'StlFolders', 'cwd' },
			{ 'StlFolders', 'file_name' },
            { 'StlGit', 'branch' },
        },
        mid  = { { 'StlLspName', 'lsp_name' }, { 'StlLsp', 'lsp' }, },
        right = {
            { 'StlLine', 'file_size' },
            { 'StlLine', 'line_column' },
            { 'StlCoolSymbol', 'cool_symbol' }, ' ',

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
        Hint=" ",
    },
    file_icons = {
        conf=' ', zig=' ', sp='S',
    }
}

-- the colors are in user.set
