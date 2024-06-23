return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      local wk = require "which-key"
  wk.register {
    ["<leader>Ti"] = { "<cmd>TSConfigInfo<CR>", "Info" },
  }
      require("nvim-treesitter.configs").setup(opts)
    end,
  }
