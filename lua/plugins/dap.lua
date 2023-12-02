return {
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
    config = function()
        require("mason-nvim-dap").setup()
        require("dapui").setup()
        require('dap-go').setup()
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        -- keymaps
        vim.keymap.set("n", "<leader>dx", "<Cmd>DapTerminate<CR>", {noremap=true})
        vim.keymap.set("n", "<F5>", "lua require'dap'.continue()<CR>")
        vim.keymap.set("n", "<F10>", "lua require'dap'.step_over()<CR>")
        vim.keymap.set("n", "<F11>", "lua require'dap'.step_into()<CR>")
        vim.keymap.set("n", "<F12>", "lua require'dap'.step_out()<CR>")
    end,
}
