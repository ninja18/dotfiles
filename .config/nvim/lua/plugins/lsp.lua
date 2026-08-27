return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"basedpyright",
					"ruff",
					"bash-language-server",
					"typescript-language-server",
					"lua-language-server",
					"clangd",
					"neocmakelsp",
					"texlab",
					"yaml-language-server",
					"css-lsp",
					"tailwindcss-language-server",
					"stylua",
					"prettierd",
					"shfmt",
					"cmakelang",
					"latexindent",
					"shellcheck",
					"eslint_d",
					"yamllint",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("lsp.lspconfig")
		end,
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
}
