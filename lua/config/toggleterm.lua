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
    direction = "horizontal",
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
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- makes <Esc> work in terminal
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
