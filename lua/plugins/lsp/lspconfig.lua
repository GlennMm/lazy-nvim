return {
  "neovim/nvim-lspconfig",
  dependecies = {

  },
  lazy = false,
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      ["<leader>lf"] = {
        "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
        "Format",
      },
      ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
      ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      ["<leader>lh"] = { function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, "Toggle Hints" },
      ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
      ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
      ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    }
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
