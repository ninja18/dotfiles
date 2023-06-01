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

  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  { 'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  },

  { "mickael-menu/zk-nvim", lazy = true },

   {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
    },
  },
}, {})

