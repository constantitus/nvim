local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'clangd'
})

lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space"] = cmp.mapping.complete(),
})

-- Fix Undefined global 'vim'
lsp.setup_nvim_cmp({
    mapping = cmp_mapping
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    -- get definition
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
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
end)

vim.keymap.set("n", "<leader>l", function() vim.diagnostic.open_float() end)

lsp.setup()

vim.diagnostic.config({
    visual_text = true
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
    }
)
