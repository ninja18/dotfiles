local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup({
  'tpope/vim-sleuth',
  'tpope/vim-fugitive',
  { 'numToStr/Comment.nvim', opts = {} },
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'knubie/vim-kitty-navigator', build = 'cp ./*.py ~/.config/kitty/' },

  {
    'lewis6991/gitsigns.nvim', -- Configure later: with keymaps and test
    lazy = true,
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() 
      require('gitsigns').setup{}
    end
  },

  {
    'luisiacc/gruvbox-baby',
    lazy = false,
    priority = 1000,
    config = function()
	    vim.cmd([[colorscheme gruvbox-baby]])
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
}, {})

