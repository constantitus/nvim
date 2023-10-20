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
            'nvim-treesitter/playground'
        },
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
        lazy = false,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    },
    -- use('rcarriga/nvim-notify')

    -- navigation
    'nvim-tree/nvim-tree.lua',
    { 'mbbill/undotree', lazy = false, },
    { 'tpope/vim-fugitive', lazy = false; },
    'theprimeagen/harpoon',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- appearance
    require("user.alpha"),
    'norcalli/nvim-colorizer.lua',
    'lukas-reineke/indent-blankline.nvim',
    {
        'hiphish/rainbow-delimiters.nvim',
        main = "ibl",
        opts = {},
        lazy = false,
    },
    'lewis6991/gitsigns.nvim',
    {
        'catppuccin/nvim',
        as = 'catpuccin',
        config = function()
            require("gitsigns").setup()
            vim.cmd('colorscheme catppuccin')
        end,
        lazy = false,
    },
    'tamton-aquib/staline.nvim',
    'nvim-tree/nvim-web-devicons',
    'stevearc/dressing.nvim',
    { 'xiyaowong/nvim-cursorword', lazy = false, },

    -- utility
    'folke/zen-mode.nvim',
    {
        "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
        lazy = true,
    },
    {
        'smoka7/hop.nvim',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
        end,
        lazy = true,
    },
    {
        "stevearc/aerial.nvim",
        config = function()
            require("aerial").setup()
        end,
        lazy = true,
    },
}

local opts = {
    defaults = { lazy = true }
}

require("lazy").setup(plugins, opts)
