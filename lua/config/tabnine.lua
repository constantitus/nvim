require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<S-CR>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

vim.api.nvim_set_hl(0, "TabnineSuggestion", {fg = "#808080"})


