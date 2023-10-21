return function()
    local lsp = require("lsp-zero")
    lsp.extend_lspconfig()

    lsp.preset("recommended")

    lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        -- goto (also sets mark B to go back)
        vim.keymap.set("n", "gd", function() -- definition
            vim.api.nvim_feedkeys("mB", "n", false)
            vim.lsp.buf.definition()
        end, opts )
        vim.keymap.set("n", "gD", function() -- declaration
            vim.api.nvim_feedkeys("mB", "n", false)
            vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "gi", function() -- implementation
            vim.api.nvim_feedkeys("mB", "n", false)
            vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
        vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>vh", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader><C-f>", vim.lsp.buf.format)
        vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float() end, opts)
    end)

    vim.diagnostic.config({
        visual_text = false,
        severity_sort = true,
        float = {
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true
        }
    )

    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        handlers = {
            lsp.default_setup,
            --[[ lua_ls = function()
                -- (Optional) Configure lua language server for neovim
                local lua_opts = lsp.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end, ]]
        }
    })
end
