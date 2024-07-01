return {
  'nvim-neotest/neotest',
  dependencies = {
    'sidlatau/neotest-dart',
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    "mrcjkb/rustaceanvim",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "fredrikaverpil/neotest-golang",
    "lawrence-laz/neotest-zig"
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
        require('neotest-dart') {
          command = 'dart', -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          -- Useful when using custom test names with @isTest annotation
          custom_test_method_names = {},
        },
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-vitest"),
        require('rustaceanvim.neotest')
      }
    });
  end
}
