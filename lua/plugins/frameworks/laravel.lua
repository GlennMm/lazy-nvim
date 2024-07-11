return {
  {
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
  },
  {
    "Bleksak/laravel-ide-helper.nvim",
    opts = {
      write_to_models = true,
      save_before_write = true,
      format_after_gen = true,
    },
    enabled = function()
      return vim.fn.filereadable("artisan") ~= 0
    end,
    keys = {
      { "<leader>lgm", function() require("laravel-ide-helper").generate_models(vim.fn.expand("%")) end, desc = "Generate Model Info for current model" },
      { "<leader>lgM", function() require("laravel-ide-helper").generate_models() end,                   desc = "Generate Model Info for all models" },
    }
  }
}
