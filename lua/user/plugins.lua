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
        'nvim-treesitter/nvim-treesitter',
        build = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/playground',
        },
        config = function() require("config.treesitter") end,
        lazy = false,
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            mappings= {
                extra = false,
            },
        },
        lazy = false,
    },
    {
        "folke/trouble.nvim",
        config = function() require("trouble").setup() end,
        lazy = false,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lua'},
            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        },
        config = require("config.cmp"),
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart', },
        event = {'BufReadPre', 'BufNewFile' },
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
        },
        config = require("config.lsp"),
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- 'rcarriga/nvim-notify' -- unused because I'm too lazy to set it up

    -- navigation
    {
        'nvim-tree/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        event = {'BufReadPre', 'BufNewFile' },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function() require("config.nvim-tree") end,
        lazy = true,
    },
    { 'theprimeagen/harpoon', lazy = true, },
    { 'mbbill/undotree', lazy = false, },
    {
        'tpope/vim-fugitive',
        cmd = { 'G', 'Git', 'Gwrite', 'Gread', 'Gdiff' },
        lazy = true,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "debugloop/telescope-undo.nvim",
        },
        config = function() require("config.telescope") end,
        lazy = true,
    },

    -- appearance
    require("config.alpha"),
    {
        'norcalli/nvim-colorizer.lua',
        event = {'BufReadPre', 'BufNewFile' },
        config = function() require("colorizer").setup() end,
        lazy = true,
    },
    { 'lewis6991/gitsigns.nvim', },
    {
        'stevearc/dressing.nvim',
        event = {'BufReadPre', 'BufNewFile' },
        config = function() require("config.dressing") end,
        lazy = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        dependencies = {
            {
                'hiphish/rainbow-delimiters.nvim',
                main = "ibl",
            },
        },
        event = {'BufReadPre', 'BufNewFile' },
        config = function() require("config.ibl") end,
        lazy = true,
    },
    {
        'catppuccin/nvim',
        as = 'catpuccin',
        config = function()
            require("gitsigns").setup()
            vim.cmd('colorscheme catppuccin')
        end,
        lazy = false,
    },
    {
        'tamton-aquib/staline.nvim',
        config = function() require("config.staline") end,
        lazy = false,
    },
    { 'xiyaowong/nvim-cursorword', lazy = false, },

    -- utility
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require("config.zenmode")
        end,
        lazy = true,
    },
    {
        "ziontee113/color-picker.nvim",
        cmd = 'PickColor',
        config = function() require("config.color-picker") end,
        lazy = true,
    },
    {
        'smoka7/hop.nvim',
        config = function() require("hop").setup{ keys = 'etovxqpdygfblzhckisuran' } end,
        lazy = true,
    },
    {
        "stevearc/aerial.nvim",
        event = {'BufReadPre', 'BufNewFile' },
        config = function() require("config.aerial") end,
        lazy = true,
    },
}

local opts = {
    defaults = { lazy = true }
}

require("lazy").setup(plugins, opts)
