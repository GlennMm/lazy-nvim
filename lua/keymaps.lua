local map = vim.keymap.set

local M = {}

function M.reload()
  local luacache = (_G.__luacache or {}).cache
  for pkg, _ in pairs(package.loaded) do
    if pkg:match '^my_.+'
    then
      print(pkg)
      package.loaded[pkg] = nil
      if luacache then
        luacache[pkg] = nil
      end
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify('Config reloaded!', vim.log.levels.INFO)
end

function M.setup()
  local opts = { noremap = true, silent = true }

  map("n", "<Esc>", "<cmd>:nohlsearch<cr>", opts)
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
  map({ "n", "x" }, "y", '"+y')
  map("n", "yy", '"+yy')
  map({ "n", "x" }, "Y", '"+Y')
  map("v", "K", ":m '<-2<CR>gv=gv")
  map("v", "J", ":m '>+1<CR>gv=gv")
  map({ "i", "n" }, "<C-z>", "<Esc>:u<CR>", opts)
  map("n", "<leader>q", "<cmd>wqa<cr>", { desc = "Exit" })
  map("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
  map("n", "<Tab>", "<cmd>:popup mousemenu<CR>")
  map("n", "<leader>r", M.reload, { noremap = true, silent = true, desc = "Reload config." })
  map(
    "n",
    "<leader>w",
    ":lua vim.wo.wrap = not vim.wo.wrap<CR>",
    { desc = "Toggle wrap.", noremap = true, silent = true }
  )
  -- map({ "i", "n" }, "<C-v>", "<Esc>+p<CR>", opts)
  vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
  vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
end

return M
