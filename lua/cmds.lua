vim.api.nvim_create_user_command('Wa', function()
  vim.cmd('wall')
end, {})

vim.api.nvim_create_user_command('Wqa', function()
  vim.cmd('wqall')
end, {})
