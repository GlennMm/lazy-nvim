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
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000
  }



}
