return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits  = true,
        columns = { "icon" },
        -- keymaps = {
        --   ["<C-h>"] = false,
        --   ["<M-h>"] = "actions.select_split"
        -- },
        view_options = { 
          show_hidden = true, 
          natural_order = true,
          is_always_hidden = function(name, _) 
            return name == '..' or name == '.git'
          end
        },
        win_options = {
          wrap = true,
        }
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    config = function()
      require("aerial").setup()
    end,
  }

}
