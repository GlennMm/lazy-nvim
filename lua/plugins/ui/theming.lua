return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {

    'ChristianChiarulli/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup()
    end
  },
  {
    "rafamadriz/neon",
    priority = 1000,
    config = function()
      vim.g.neon_style = "doom"
      vim.g.neon_italic_keyword = true
      vim.g.neon_italic_function = true
      vim.g.neon_italic_variable = false
      vim.g.neon_italic_comment = true
      vim.g.neon_italic_boolean = true
      vim.g.neon_bold = true
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      -- vim.cmd [[colorscheme tokyodark]]
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
    end
  }
}
