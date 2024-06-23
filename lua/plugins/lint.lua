return {
  "mfussenegger/nvim-lint",
  lazy = false,
  event = { "BufWritePre", "BufNewFile" },
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8" },
      typescript = { "eslint_d" },
      javascript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      c = { "cpplint" },
      cpp = { "cpplint" },
      sh = { "shellcheck" },
    }
  end,
}
