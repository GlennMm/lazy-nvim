return {
  "williamboman/mason.nvim",
  lazy = false,
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  opts = function()
    return require "plugins.lsp.config.mason"
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
        if server == "tsserver" then
          return
        end
        if server == "rust_analyzer" then
          return
        end

        local lsp_cfg = require('plugins.lsp.config.lsp')
        local opt = {
          on_attach = lsp_cfg.on_attach,
          capabilities = lsp_cfg.capabilities,
          on_init = lsp_cfg.on_init,
        }
        local require_ok, settings = pcall(require, "plugins.lsp.settings." .. server)
        if require_ok then
          opt = vim.tbl_deep_extend("force", settings, opt)
        end

        lspconfig[server].setup(opt)
      end,
    })

    vim.g.mason_binaries_list = opts.ensure_installed
  end,
}
