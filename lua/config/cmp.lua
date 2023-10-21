return function()
    local lsp = require("lsp-zero")

    local cmp = require("cmp")
    -- local cmp_action = lsp.cmp_action()
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    require("luasnip.loaders.from_vscode").lazy_load()

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
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
        },
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space"] = cmp.mapping.complete(),
        }),
        lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    })
end
