local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- feedback --
    --------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/playground",
        },
        config = function() require("config.treesitter") end,
        event = "VeryLazy",
        lazy = true,
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = {
                extra = false,
            },
        },
        event = "VeryLazy",
        lazy = true,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function() require("trouble").setup() end,
        lazy = true,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
        lazy = true,
    },
    {
        "williamboman/mason.nvim",
        config = true,
        event = "VeryLazy",
        lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = require("config.cmp"),
        event = { "InsertEnter" },
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart", },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "folke/neodev.nvim",
                config = function() require("neodev").setup() end,
            },
        },
        config = function() require("config.lsp") end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "rcarriga/nvim-dap-ui",
        cmd = {
            "DapInstall",
            "DapUiToggle",
            "DapToggleBreakpoint",
            "DapContinue"
        },
        dependencies = {
            "mfussenegger/nvim-dap",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
        },
        config = function() require("config.dap") end,
        lazy = true,
    },

    -- navigation --
    ----------------
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("config.oil") end,
        lazy = false,
    },
    {
        "theprimeagen/harpoon",
        config = function() require("config.harpoon") end,
        event = "VeryLazy",
        lazy = true,
    },
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        lazy = true,
    },
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git", "Gwrite", "Gread", "Gdiff", "Gvdiff" },
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        config = function() require("config.telescope") end,
        event = "VeryLazy",
        lazy = true,
    },

    -- appearance --
    ----------------
    {
        "goolord/alpha-nvim",
        config = function() require("config.alpha") end,
        lazy = false,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end,
        event = "VeryLazy",
        lazy = true,
    },
    {
        "stevearc/dressing.nvim",
        config = function() require("config.dressing") end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        dependencies = {
            {
                "hiphish/rainbow-delimiters.nvim",
                main = "ibl",
            },
        },
        config = function() require("config.ibl") end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "catppuccin/nvim",
        as = "catpuccin",
        config = function() vim.cmd("colorscheme catppuccin") end,
        lazy = false,
    },
    {
        "tamton-aquib/staline.nvim",
        config = function() require("config.staline") end,
        event = "VeryLazy",
        lazy = false,
    },
    {
        'echasnovski/mini.cursorword',
        version = false,
        config = function() require("mini.cursorword").setup({ delay = 0 }) end,
        event = "VeryLazy",
        lazy = true,
    },
    {
        "folke/noice.nvim",
        opts = {
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure
            -- to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function() require("config.noice") end,
        event = "VeryLazy",
        lazy = true,
    },

    -- utility --
    -------------
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("config.neorg") end,
        event = "BufReadPre",
        lazy = true,
    },
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "ToggleTermSendVisualSelection" },
        version = "*",
        config = function() require("config.toggleterm") end,
        lazy = true,
    },
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function() require("config.zenmode") end,
        lazy = true,
    },
    {
        "ziontee113/color-picker.nvim",
        cmd = {
            "PickColor",
            "ConvertHEXandRGB",
            "ConvertHEXandHSL",
        },
        config = function() require("config.color-picker") end,
        lazy = true,
    },
    {
        "smoka7/hop.nvim",
        event = "VeryLazy",
        config = function() require("config.hop") end,
        lazy = true,
    },
    {
        "stevearc/aerial.nvim",
        config = function() require("config.aerial") end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "echasnovski/mini.align",
        version = false,
        init = function() require("mini.align").setup() end,
        lazy = true,
    },
    {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh",
        config = function() require("config.tabnine") end,
        event = "VeryLazy",
        lazy = true,
    },
    --[[ {
        "3rd/image.nvim",
        config = function() require("config.image") end,
        event = "VeryLazy",
        lazy = true,
    }, ]]
}

require("lazy").setup(plugins)
