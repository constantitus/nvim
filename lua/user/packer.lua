-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

    -- feedback
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/nvim-treesitter-context')
	use('nvim-treesitter/playground')
    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                -- icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- use('github/copilot.vim')
    use('rcarriga/nvim-notify')

    -- navigation
    use('nvim-tree/nvim-tree.lua')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('theprimeagen/harpoon')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
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
    }

    -- appearance
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }
    use('norcalli/nvim-colorizer.lua')
    use('lukas-reineke/indent-blankline.nvim')
    use('hiphish/rainbow-delimiters.nvim')
    use('nvim-tree/nvim-web-devicons')
    use('lewis6991/gitsigns.nvim')
    use {
        'catppuccin/nvim',
        as = 'catpuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- utility
    use('folke/zen-mode.nvim')
    use {
        "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end
    }
    use {
        'smoka7/hop.nvim',
        tag = '*', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

end)
