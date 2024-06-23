local map = vim.keymap.set

local M = {}

function M.reload()
  vim.cmd("source ~/.config/nvim3/init.lua")
  print("Reloaded!")
end

function M.setup()
  local opts = { noremap = true, silent = true }

  map("n", "<C-i>", "<C-i>", opts)
  map("n", "n", "nzz", opts)
  map("n", "N", "Nzz", opts)
  map("n", "*", "*zz", opts)
  map("n", "#", "#zz", opts)
  map("n", "g*", "g*zz", opts)
  map("n", "g#", "g#zz", opts)
  map("v", "<", "<gv", opts)
  map("v", ">", ">gv", opts)
  map("x", "p", [["_dP]])
  map({ "n", "o", "x" }, "<s-Left>", "^", opts)
  map({ "n", "o", "x" }, "<s-Riht>", "g_", opts)
  map({ "n", "x" }, "j", "gj", opts)
  map({ "n", "x" }, "k", "gk", opts)
  map(
    "n",
    "<leader>w",
    ":lua vim.wo.wrap = not vim.wo.wrap<CR>",
    { desc = "Toggle wrap.", noremap = true, silent = true }
  )
  map({ "n", "x" }, "y", '"+y')
  map("n", "yy", '"+yy')
  map({ "n", "x" }, "Y", '"+Y')
  map("v", "K", ":m '<-2<CR>gv=gv")
  map("v", "J", ":m '>+1<CR>gv=gv")
  map({ "i", "n" }, "<C-z>", "<Esc>:u<CR>", opts)
  map({ "i", "n" }, "<C-v>", "<Esc>+p<CR>", opts)
  map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
  map("n", "<leader>Q", "<cmd>wqa<cr>", { desc = "Quit all" })

  map("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
  map("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
  vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
  vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
  map("n", "<leader>r", M.reload, { noremap = true, silent = true })
end

return M
