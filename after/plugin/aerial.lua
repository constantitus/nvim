require("aerial").setup({
    layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,

        default_direction = "prefer_left",
        placement = "window",
    },

  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>A", "<cmd>AerialToggle!<CR>")
