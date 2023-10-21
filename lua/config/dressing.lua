require("dressing").setup({
  input = {
    enabled = true,
    title_pos = "left",
    insert_only = true, -- When true, <Esc> will close the modal
    start_in_insert = true, -- When true, input will start in insert mode.
    border = "rounded", -- These are passed to nvim_open_win
    relative = "cursor", -- 'editor' and 'win' will default to being centered

    prefer_width = 40, -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    buf_options = {},
    win_options = {
      -- Disable line wrapping
      wrap = false,
      -- Indicator for when text exceeds window
      list = true,
      listchars = "precedes:…,extends:…",
      -- Increase this for more context when text scrolls off the window
      sidescrolloff = 0,
    },

    -- Set to `false` to disable
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
  },
  select = {
      enabled = true, -- Set to false to disable the vim.ui.select implementation
      backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" }, -- Priority list of preferred vim.select implementations

      trim_prompt = true, -- Trim trailing `:` from prompt

    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = nil,

    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    builtin = {
      show_numbers = true,
      border = "rounded",
      relative = "editor",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },
    },
  },
})
