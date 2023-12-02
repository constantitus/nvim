return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
        {
            "hiphish/rainbow-delimiters.nvim",
            main = "ibl",
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes

        -- vim.g.rainbow_delimiters = { highlight = highlight }
        hooks.register(
            hooks.type.SCOPE_HIGHLIGHT,
            hooks.builtin.scope_highlight_from_extmark
        )

        require("ibl").setup {
            indent = {
                char = "▏",
            },
            scope = {
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            },
        }

        local rainbow_delimiters = require('rainbow-delimiters')

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            highlight = highlight,
        }
    end,
}
