return{ 
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = function()
      return require "configs.mason"
    end,
    config = function(_, opts)

      local wk = require "which-key"
  wk.register {
    ["<leader>lI"] = { "<cmd>Mason<cr>", "Mason Info" },
  }

      local lspconfig = require("lspconfig")
      require("mason").setup(opts)
      require("mason-lspconfig").setup({
        ensure_installed = opts.ensure_installed,
      })

      -- custom cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})

      require('mason-lspconfig').setup_handlers({
        function(server)
          local lsp_cfg = require('configs.lspconfig')
          local opt = {
            on_attach = lsp_cfg.on_attach,
            capabilities = lsp_cfg.capabilities,
            on_init = lsp_cfg.on_init,
          }
          local require_ok, settings = pcall(require, "lspsettings." .. server)
          if require_ok then
            opt = vim.tbl_deep_extend("force", settings, opt)
          end
          if server == "tsserver" then
            return
          end

          lspconfig[server].setup(opt)
        end,
      })

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },

  {
    "neovim/nvim-lspconfig",
    -- event = "User FilePost",
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
    ["<leader>lh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
    ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  }

      require("configs.lspconfig").defaults()
    end,
  }
}
