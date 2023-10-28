require("mason-nvim-dap").setup()
require("dapui").setup()
require('dap-go').setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})
