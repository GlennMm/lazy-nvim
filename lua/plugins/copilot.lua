local M = {
  "zbirenbaum/copilot.lua",
  lazy = false,
  cmd = "Copilot",
  event = "InsertEnter",
  dependencies = {
    -- "zbirenbaum/copilot-cmp",
    'onsails/lspkind.nvim',
  },
}

function M.config()
  require("copilot").setup {
    panel = {
      keymap = {
        jump_next = "<c-j>",
        jump_prev = "<c-k>",
        accept = "<c-l>",
        refresh = "r",
        open = "<M-CR>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<c-l>",
        next = "<c-j>",
        prev = "<c-k>",
        dismiss = "<c-h>",
      },
    },
    filetypes = {
      markdown = true,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node",
  }

  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "<c-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

  -- require("copilot_cmp").setup()

  local lspkind = require 'lspkind'
  lspkind.init {
    symbol_map = {
      Copilot = '',
    },
  }

  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#f7f7f7' })
end

return M