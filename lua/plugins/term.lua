return {
  "numToStr/FTerm.nvim",
  config = function()
    local fterm = require("FTerm")
    fterm.setup({
      dimensions = {
        height = 0.8,
        width = 0.8,
      },
      border = "single",
    })
    vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

    local gitui = fterm:new({ cmd = "gitui", border = "single", dimensions = { height = 0.8, width = 0.8 } })
    local btop = fterm:new({ cmd = "btop", border = "single", dimensions = { height = 0.8, width = 0.8 } })
    
    vim.keymap.set('n', '<leader>tg', function() gitui:toggle() end)
    vim.keymap.set('n', '<leader>tb', function() btop:toggle() end)

  end,
  keys = {
    { "n", "<leader>tt", "<cmd>lua require('FTerm').toggle()<CR>", desc = "Floating Term" },
    { "t", "<leader>tt", "<cmd>lua require('FTerm').toggle()<CR>", desc = "Floating Term"  },
  }
}
