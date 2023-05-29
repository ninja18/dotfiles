local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = ' '

opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.incsearch = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.breakindent = true
opt.termguicolors = true
opt.completeopt = 'menuone,noinsert'
opt.updatetime = 250
opt.splitright = true
opt.splitbelow = true
opt.signcolumn = 'yes'

-- Disable unnecessary built-in plugins if performance is affected
-- refer brainfucsec config for ideas
