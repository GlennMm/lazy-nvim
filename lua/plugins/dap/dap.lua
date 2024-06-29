return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    'rcarriga/nvim-dap-ui',
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "leoluz/nvim-dap-go",
    'theHamsta/nvim-dap-virtual-text',
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local wk = require "which-key"
    local dap = require("dap")
    local dapui = require("dapui")
    require("mason-nvim-dap").setup {
      ensured_installed = {
        "delve",
        "codelldb",
        "cpptools",
        "debugpy",
        "go-debug-adapter",
        "js-debug-adapter",
        "dart-debug-adapter",
      },
      automatic_install = true,
      handlers = {}
    }
    wk.register {
      ["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      ["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
      ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
      ["<leader>dp"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
      ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      ["<leader>dU"] = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
    }

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end, { desc = "Debug: Set Breakpoint" })


    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    }
    require("nvim-dap-virtual-text").setup {}
    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    require("dap-go").setup()
    require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"
    dap.adapters.dart = {
      type = "executable",
      command = "flutter",
      args = { "debug_adapter" },
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Flutter Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
        toolArgs = { "-d", "linux" },
      },
    }
    -- require("telescope").load_extension "dap"
    -- ui modifications
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = " ", texthl = "red", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "red", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "red", linehl = "", numhl = "" })
  end,
}
