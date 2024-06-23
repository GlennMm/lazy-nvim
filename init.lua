require("options")
require("manager")
require("keymaps").setup()
require("autocmds")
require "current-theme"

vim.notify_once("Let code like never before.", vim.log.levels.INFO, { title = "Neovim" })
