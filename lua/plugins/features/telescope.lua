-- local z_utils = require("telescope._extensions.zoxide.utils")

return {
  {
    'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    tag = '0.1.8',
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>",  desc = "Find files" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>",   desc = "Grep" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').old_files()<CR>",   desc = "Recent files" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>",     desc = "Buffers" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>",   desc = "Help tags" },
      { "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", desc = "Grep word" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<CR>",    desc = "Commands" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
        old_files = { theme = "dropdown" },
        buffers = { theme = "dropdown" },

      },
      extensions = {
        -- zoxide = {
        --   prompt_title = "[ Walking on the shoulders of TJ ]",
        --   mappings = {
        --     default = {
        --       after_action = function(selection)
        --         print("Update to (" .. selection.z_score .. ") " .. selection.path)
        --       end
        --     },
        --     ["<C-s>"] = {
        --       before_action = function(selection) print("before C-s") end,
        --       action = function(selection)
        --         vim.cmd.edit(selection.path)
        --       end
        --     },
        --     -- Opens the selected entry in a new split
        --     ["<C-q>"] = { action = z_utils.create_basic_command("split") },
        --   },
        -- },
        lazy = {
          -- Optional theme (the extension doesn't set a default theme)
          theme = "ivy",
          -- Whether or not to show the icon in the first column
          show_icon = true,
          -- Mappings for the actions
          mappings = {
            open_in_browser = "<C-o>",
            open_in_file_browser = "<M-b>",
            open_in_find_files = "<C-f>",
            open_in_live_grep = "<C-g>",
            open_in_terminal = "<C-t>",
            open_plugins_picker = "<C-b>", -- Works only after having called first another action
            open_lazy_root_find_files = "<C-r>f",
            open_lazy_root_live_grep = "<C-r>g",
            change_cwd_to_plugin = "<C-c>d",
          },
          -- Extra configuration options for the actions
          actions_opts = {
            open_in_browser = {
              -- Close the telescope window after the action is executed
              auto_close = false,
            },
            change_cwd_to_plugin = {
              -- Close the telescope window after the action is executed
              auto_close = false,
            },
          },
          -- Configuration that will be passed to the window that hosts the terminal
          -- For more configuration options check 'nvim_open_win()'
          terminal_opts = {
            relative = "editor",
            style = "minimal",
            border = "rounded",
            title = "Telescope lazy",
            title_pos = "center",
            width = 0.5,
            height = 0.5,
          },
          -- Other telescope configuration options
        },
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      telescope.load_extension('themes')
      telescope.load_extension('dap')
      -- telescope.load_extension('zoxide')
      telescope.load_extension "lazy"
      telescope.load_extension('fzf')
    end,
  },
  {
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    config = function()
      local ctactions = require("cheatsheet.telescope.actions")
      require("cheatsheet").setup({
        bundled_cheetsheets = {
          enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
          disabled = { "nerd-fonts" },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            "auto-session",
            "goto-preview",
            "octo.nvim",
            "telescope.nvim",
            "vim-easy-align",
            "vim-sandwich",
          },
          disabled = { "gitsigns" },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ["<CR>"] = ctactions.select_or_fill_commandline,
          ["<A-CR>"] = ctactions.select_or_execute,
          ["<C-Y>"] = ctactions.copy_cheat_value,
          ["<C-E>"] = ctactions.edit_user_cheatsheet,
        },
      })
    end,
  },
  "nvim-telescope/telescope-dap.nvim",
  {
    "tsakirist/telescope-lazy.nvim",
    event = "VeryLazy",
  },
  {
    "andrew-george/telescope-themes",
    event = "VeryLazy",
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "jvgrootveld/telescope-zoxide",
    event = "VeryLazy",
  }
}
