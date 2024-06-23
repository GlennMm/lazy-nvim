return {
    "nvim-tree/nvim-tree.lua",
    
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
    config = function(_, opts)
      local wk = require "which-key"
  wk.register {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  }
      require("nvim-tree").setup(opts)
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", mode = "n", desc = "Toggle nvim tree." },
    },
  }
