return {
  "joeveiga/ng.nvim",
  lazy = false,
  opts = {},
  config = function()
    local opts = { noremap = true, silent = true }
    local ng = require("ng");
    vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, { noremap = true, silent = true, desc = "Go to template component" })
    vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, { noremap = true, silent = true, desc = "Go to compoenent's ts file." })
    vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)
  end,
}
