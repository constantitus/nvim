require("telescope").load_extension("undo")
require("telescope").load_extension("git_worktree")
-- require("telescope").load_extension("media_files")
require("telescope").setup({
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "webm", "mp4"}
        }
    }
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", function() builtin.find_files({no_ignore=true}) end, {})
vim.keymap.set("n", "<leader>pgf", builtin.git_files, {})
vim.keymap.set("n", "<leader>pgc", builtin.git_commits, {})
vim.keymap.set("n", "<leader>pgb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>pu", "<cmd>Telescope undo<cr>")
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<leader>N", function()
    require("telescope").extensions.notify.notify()
end)
vim.keymap.set("n", "<leader>gt", function()
    require("telescope").extensions.git_worktree.git_worktrees()
end)
vim.keymap.set("n", "<leader>gT", function()
    require("telescope").extensions.git_worktree.create_git_worktree()
end)
--[[ vim.keymap.set("n", "<leader>pi", function()
    require("telescope").extensions.media_files.media_files()
end) ]]
