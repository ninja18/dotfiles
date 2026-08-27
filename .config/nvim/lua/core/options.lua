local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if not vim.env.PATH:find(mason_bin, 1, true) then
	vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

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

opt.conceallevel = 2
g.tex_conceal = "abdmgs"
