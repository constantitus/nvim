local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- goto (also sets mark B to go back)
    vim.keymap.set("n", "gd", function() -- definition
        vim.api.nvim_feedkeys("mB", "n", false)
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gD", function() -- declaration
        vim.api.nvim_feedkeys("mB", "n", false)
        vim.lsp.buf.declaration()
    end, opts)
    vim.keymap.set("n", "gi", function() -- implementation
        vim.api.nvim_feedkeys("mB", "n", false)
        vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol("") end, opts)
    vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.open_float() end, opts)
    vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader><C-f>", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>k", function() vim.diagnostic.open_float() end, opts)
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = "rounded" }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        border = "rounded",
    }
)

require("mason").setup()
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

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                ...
            },
            ...
        },
    },
})
