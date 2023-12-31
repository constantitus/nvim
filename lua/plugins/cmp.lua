return {
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
    event = { "InsertEnter" },
    config = function()
        local lsp = require("lsp-zero")
        lsp.extend_cmp()

        local cmp = require("cmp")
        local cmp_action = lsp.cmp_action()
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        require("luasnip.loaders.from_snipmate").lazy_load()
        -- require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snipet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = lsp.cmp_format(),
            preselect = 'item',
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
            },
            completion = {
                completeopt = 'menu,menuone,noinsert,noselect',
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ["<C-Space"] = cmp.mapping.complete(),
            }),
            lua_ls = function()
                -- (Optional) Configure lua language server for neovim
                local lua_opts = lsp.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end,
        })
    end,
}
