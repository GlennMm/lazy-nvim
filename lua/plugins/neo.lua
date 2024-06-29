return {
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }
  },
  {
    "folke/neoconf.nvim",
    event = "VeryLazy",
    cmd = "Neoconf",
  },
}
