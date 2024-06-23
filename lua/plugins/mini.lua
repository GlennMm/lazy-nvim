local M = { 
  "echasnovski/mini.nvim", 
  lazy = false,
  version = "*" }
function M.config()

  -- Examples:
  --  - va)  - [V]isually select [A]round [)]parenthen
  --  - yinq - [Y]ank [I]nside [N]ext [']quote
  --  - ci'  - [C]hange [I]nside [']quote
  require("mini.ai").setup { n_lines = 500 }
  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  -- - sd'   - [S]urround [D]elete [']quotes
  -- - sr)'  - [S]urround [R]eplace [)] [']
  require("mini.surround").setup()
  -- require("mini.move").setup {
  --   -- Module mappings. Use `''` (empty string) to disable one.
  --   mappings = {
  --     -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
  --     left = "<M-h>",
  --     right = "<M-l>",
  --     down = "<M-j>",
  --     up = "<M-k>",
  --
  --     -- Move current line in Normal mode
  --     line_left = "<M-h>",
  --     line_right = "<M-l>",
  --     line_down = "<M-j>",
  --     line_up = "<M-k>",
  --   },
  --
  --   -- Options which control moving behavior
  --   options = {
  --     -- Automatically reindent selection during linewise vertical move
  --     reindent_linewise = true,
  --   },
  -- }
  -- -- require('mini.statusline').setup {}

  -- ... and there is more!
  --  Check out: https://github.com/echasnovski/mini.nvim
end
return M
