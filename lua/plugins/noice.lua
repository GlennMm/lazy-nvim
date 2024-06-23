local M  = { -- lazy.nvim
  "folke/noice.nvim",
  lazy = false,
  opts = {
    lsp = {
      signature = {
        enabled = false
      },
      hover = {
        enabled = false
      },
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      "rcarriga/nvim-notify",
      config = function()
        --[[ vim.notify = require("notify") ]]
      end
    },
  },
}

return M 
