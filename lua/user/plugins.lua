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
    -- feedback
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
            -- Dap
            "folke/neodev.nvim",
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
        },
        config = require("config.lsp"),
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
    },
    {
        "rcarriga/nvim-dap-ui",
        cmd = { "DapInstall", "DapUiToggle", "DapToggleBreakpoint", "DapContinue" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function() require("config.dap") end,
        lazy = true,
    },

    -- navigation
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function() require("config.nvim-tree") end,
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
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
        cmd = { "G", "Git", "Gwrite", "Gread", "Gdiff" },
        -- TODO: command Gdiff not found after loading vim-fugitive
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

    -- appearance
    require("config.alpha"),
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
        lazy = false,
    },
    {
        "xiyaowong/nvim-cursorword",
        event = "VeryLazy",
        lazy = true,
    },
    {
        "folke/noice.nvim",
        opts = {
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function() require("config.noice") end,
        event = "VeryLazy",
        lazy = true,
    },

    -- utility
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function() require("config.zenmode") end,
        lazy = true,
    },
    {
        "ziontee113/color-picker.nvim",
        cmd = "PickColor",
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
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "ToggleTermSendVisualSelection" },
        version = "*",
        config = function() require("config.toggleterm") end,
        lazy = true,
    }
}

require("lazy").setup(plugins)
