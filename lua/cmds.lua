vim.api.nvim_create_user_command('Wa', function()
  vim.cmd('wall')
end, {})
