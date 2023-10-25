require("toggleterm").setup({
    size = 10,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filesystems = {},
    shade_terminals = false,
    shading_factor = 2,
    shade_in_insert = true,
    start_in_insert = true,
    insert_mappings = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    autochdir = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlightrs = {
            border = "Normal",
            background = "Normal",
        },
    },
})
