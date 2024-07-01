return {
  "folke/which-key.nvim",
  lazy = true,
  opts = {},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      ["<leader>"] = {
        ["?"] = { name = "Cheatsheet" },
        a = { name = "Angular" },
        n = { name = "Nx" },
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
        x = { name = "Trouble" },
        T = { name = "Todo" }
      },
    })
  end
}
