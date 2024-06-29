return {
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } }
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
      { "<C-e>", ":Neotree float<CR>", desc = "Neo-tree float" },
      { "<leader>e", ":Neotree toggle<CR>", desc = "Neotree toggle" },
    },
}}
