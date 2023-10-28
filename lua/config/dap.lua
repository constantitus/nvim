require("dapui").setup()
require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})
require("mason-nvim-dap").setup()
