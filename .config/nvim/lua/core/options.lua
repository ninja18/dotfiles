local g = vim.g
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.incsearch = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
opt.termguicolors = true
opt.completeopt = "menu,menuone,noinsert"
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "yes"
opt.tabstop = 2
opt.expandtab = true

-- Conceal settings affecting latex
opt.conceallevel = 2
g.tex_conceal = "abdmgs"
vim.cmd([[
  hi Conceal guibg=NONE
  hi Conceal guifg=NONE
  hi Conceal ctermbg=NONE
  hi Conceal ctermfg=NONE
]])

-- Disable unnecessary built-in plugins if performance is affected
-- refer brainfucsec config for ideas
