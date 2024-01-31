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
        local dap  =  require("dap")
        local dapui = require("dapui")
        require("mason-nvim-dap").setup({
            automatic_setup = true,
        })
        dapui.setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        -- golang
        require('dap-go').setup()

        -- neodev
        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        -- codelldb
        local mason_registry = require("mason-registry")
        local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
        local codelldb_path = codelldb_root .. "adapter/codelldb"
        local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"

        dap.adapters.lldb = {
            type = "server",
            port = "${port}",
            host = "127.0.0.1",
            executable = {
                command = codelldb_path,
                args = { "--liblldb", liblldb_path, "--port", "${port}" },
            },
            name = "lldb",
        }

        dap.configurations.c = {
            {
                type = "lldb",
                request = "launch",
                args = function()
                    local args_string = vim.fn.input("Input arguments: ")
                    return vim.split(args_string, " ")
                end,
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd().."/", "file")
                end,
                cwd = "${workspaceFolder}",
                terminal = "integrated"
            }
        }

        dap.configurations.cpp = dap.configurations.c

        dap.configurations.rust = {
            {
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd().."/", "file")
                end,
                args = function()
                    local args_string = vim.fn.input("Input arguments: ")
                    return vim.split(args_string, " ")
                end,
                cwd = "${workspaceFolder}",
                terminal = "integrated",
                sourceLanguages = { "rust" }
            }
        }

        -- keymaps
        vim.keymap.set("n", "<leader>dx", "<Cmd>DapTerminate<CR>", {noremap=true})
        vim.keymap.set("n", "<F5>", "lua require'dap'.continue()<CR>")
        vim.keymap.set("n", "<F10>", "lua require'dap'.step_over()<CR>")
        vim.keymap.set("n", "<F11>", "lua require'dap'.step_into()<CR>")
        vim.keymap.set("n", "<F12>", "lua require'dap'.step_out()<CR>")
    end,
}
