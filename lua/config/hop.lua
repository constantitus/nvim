require("hop").setup { keys = 'etovxqpdygfblzhckisuran' }
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
