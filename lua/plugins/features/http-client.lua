return {
  'mistweaverco/kulala.nvim',
  event = 'VeryLazy',
  config = function()
    -- Setup is required, even if you don't pass any options
    require('kulala').setup({
      -- default_view, body or headers
      default_view = "body",
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = "dev",
      -- enable/disable debug mode
      debug = false,
      -- default formatters for different content types
      formatters = {
        json = { "jq", "." },
        xml = { "xmllint", "--format", "-" },
        html = { "xmllint", "--format", "--html", "-" },
      },
      -- default icons
      icons = {
        inlay = {
          loading = "⏳",
          done = "✅ "
        },
        lualine = "🐼",
      },
      -- additional cURL options
      -- e.g. { "--insecure", "-A", "Mozilla/5.0" }
      additional_curl_options = {},
    })
    vim.api.nvim_set_keymap("n", "<leader>rp", ":lua require('kulala').jump_prev()<CR>",
      { noremap = true, silent = true, desc = "Jump to previous request" })
    vim.api.nvim_set_keymap("n", "<leader>rn", ":lua require('kulala').jump_next()<CR>",
      { noremap = true, silent = true, desc = "Jump to next request" })
    vim.api.nvim_set_keymap("n", "<leader>rr", ":lua require('kulala').run()<CR>",
      { noremap = true, silent = true, desc = "Run request" })
    vim.api.nvim_set_keymap("n", "<leader>rt", ":lua require('kulala').toggle_view()<CR>",
      { noremap = true, silent = true, desc = "Toggle view" })
  end
}
