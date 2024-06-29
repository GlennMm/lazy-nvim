return {
  "folke/which-key.nvim",
  lazy = true,
  opts = {},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      ["<leader>"] = {
        -- ? = { function ()
        --
        -- end , "Cheatsheet"},
        f = { name = "Telescope" },
        l = { name = "Lsp" },
        L = {
          name = "Lazy",
          l = { function() vim.cmd([[Lazy]]) end, "Lazy" },
          s = { function() vim.cmd([[Lazy sync]]) end, "Lazy Sync" },
        },
        d = { name = "Debug" },
        g = { name = "Git" },
        t = { name = "Terminal" },
        u = { name = "Utils" },
        p = { name = "Projects" },
        T = { name = "Todo" }
      },
    })
  end
}
