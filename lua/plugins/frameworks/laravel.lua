return { {
  "adalessa/laravel.nvim",
  event = "VeryLazy",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "nvimtools/none-ls.nvim",
    { 'jwalton512/vim-blade', event = "VeryLazy" }
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    { "<leader>lm", ":Laravel related<cr>" },
  },
  config = true,
},
  {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',   -- if using nvim-cmp
    },
    ft = { 'blade', 'php' } -- optional, improves startup time
  }
}
