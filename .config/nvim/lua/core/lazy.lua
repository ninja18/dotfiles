vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("lazy").setup({
	"tpope/vim-sleuth",
	"tpope/vim-fugitive", -- Learn
	{ "numToStr/Comment.nvim", opts = {} },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "knubie/vim-kitty-navigator", build = "cp ./*.py ~/.config/kitty/" },
	{
		"machakann/vim-sandwich",
		config = function()
			vim.cmd([[
        let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
        let g:sandwich#recipes += [
        \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
        \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
        \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
        \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
        \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
        \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
        \ ]
        ]])
		end,
	},

	{
		"lewis6991/gitsigns.nvim", -- Configure later: with keymaps and test -- Learn
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"luisiacc/gruvbox-baby",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox-baby]])
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects", -- Learn
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
			},
		},
	},

	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	{ "mickael-menu/zk-nvim", lazy = true },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-omni",
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	{ "lervag/vimtex" }, -- Learn: motion and texobjects offered by vimtex

	"cdelledonne/vim-cmake",

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- Learn: all readme items
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			-- Add your own debuggers here
		},
	},

	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = {
					"~/",
					"~/Documents/others/*",
					"~/Documents/programming/*",
					"~/Documents/Physics/*",
					"~/Downloads",
					"/",
				},
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	"mbbill/undotree",
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
	},
}, {})

-- TODOs
-- learn to use a diff plugin
-- Configure some plugins later
-- find and replace across multiple files - spectre and muren plugins, treesitter-refactor
