local opt = vim.opt
local g = vim.g

g.mapleader = " "       -- Make sure to set `mapleader` before lazy so your mappings are correct
g.maplocalleader = "\\" -- Same for `maplocalleader`

opt.showmode = false
opt.autowriteall = true
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"
opt.writebackup = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.laststatus = 3
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 100
opt.wrap = false
opt.virtualedit = "block"
opt.termguicolors = true
opt.expandtab = true
opt.whichwrap:append("<>[]hl")
opt.cmdheight = 0

g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0
g.toggle_theme_icon = "   "
g.editorconfig = true

vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
