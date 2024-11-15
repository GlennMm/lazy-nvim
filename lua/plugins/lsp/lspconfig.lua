return {
  "neovim/nvim-lspconfig",
  dependecies = {
    {
      "SmiteshP/nvim-navic",
    }
  },
  lazy = false,
  keys = {
    { "<leader>l",  group = "Lsp" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    { "<leader>li", "<cmd>LspInfo<cr>",                                                            desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",                                     desc = "Next Diagnostic" },
    { "<leader>lh", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Toggle Hints" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                     desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                                         desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>",                                    desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                           desc = "Rename" },
  },
  config = function()
    local lsp_cfg = require("plugins.lsp.config.lsp")
    lsp_cfg.defaults()

    vim.g.rustaceanvim = function()
      return {
        -- other rustacean settings. --
        server = {
          on_attach = lsp_cfg.on_attach,

        }
      }
    end
  end,

}
