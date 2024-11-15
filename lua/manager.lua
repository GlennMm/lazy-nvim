local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
lazy.setup({
  { import = "plugins" },
  { import = "plugins.ui" },
  { import = "plugins.cmp" },
  { import = "plugins.features" },
  { import = "plugins.lsp" },
  { import = "plugins.dap" },
  { import = "plugins.test" },
  { import = "plugins.languages" },
  { import = "plugins.misc" }
}, { defaults = { lazy = true } })
