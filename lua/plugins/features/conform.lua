return {
    "stevearc/conform.nvim",
    dependecies = {
      {"zapling/mason-conform.nvim", event = "VeryLazy", opts = {} },
    },
    lazy = false,
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 300,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        go = { "gofmt" }
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  }
