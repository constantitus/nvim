vim.keymap.set("n", "<leader>qf", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>er", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)

