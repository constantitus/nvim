return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/playground",
    },
    event = "VeryLazy",
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "rust", "markdown", "markdown_inline",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<c-backspace>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                        ['ii'] = '@conditional.inner',
                        ['ai'] = '@conditional.outer',
                        ['il'] = '@loop.inner',
                        ['al'] = '@loop.outer',
                        ['at'] = '@comment.outer',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        -- ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        -- ['<leader>A'] = '@parameter.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    -- goto_next_start = {
                    --     [']m'] = '@function.outer',
                    --     [']]'] = '@class.outer',
                    -- },
                    -- goto_next_end = {
                    --     [']M'] = '@function.outer',
                    --     [']['] = '@class.outer',
                    -- },
                    -- goto_previous_start = {
                    --     ['[m'] = '@function.outer',
                    --     ['[['] = '@class.outer',
                    -- },
                    -- goto_previous_end = {
                    --     ['[M'] = '@function.outer',
                    --     ['[]'] = '@class.outer',
                    -- },
                    -- goto_next = {
                    --   [']i'] = "@conditional.inner",
                    -- },
                    -- goto_previous = {
                    --   ['[i'] = "@conditional.inner",
                    -- }
                },
            },
        }

        require('treesitter-context').setup {
            enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers = true,
            multiline_threshold = 20, -- Maximum number of lines to show for a single context
            trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator = '-',
            zindex = 20,              -- The Z                                                                             -index of the context window
            on_attach = nil,          -- (fun(buf: integer): boolean) return false to disable attaching
        }
    end,
}
