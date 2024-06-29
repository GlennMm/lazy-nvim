return {
  'rcarriga/nvim-dap-ui',
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  opts = {},
  event = "VeryLazy",
  config = function()
    require("dapui").setup()
  end
}
