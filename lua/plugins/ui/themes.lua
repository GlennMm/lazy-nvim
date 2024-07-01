return {
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000
  }



}
