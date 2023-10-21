local builtin = require('telescope.builtin')
require("telescope").load_extension("undo")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set("n", "<leader>pu", "<cmd>Telescope undo<cr>")
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

