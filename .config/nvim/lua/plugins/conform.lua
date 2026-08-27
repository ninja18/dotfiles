return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format" },
					javascript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					json = { "prettierd" },
					jsonc = { "prettierd" },
					html = { "prettierd" },
					css = { "prettierd" },
					scss = { "prettierd" },
					markdown = { "prettierd" },
					yaml = { "prettierd" },
					sh = { "shfmt" },
					bash = { "shfmt" },
					tex = { "latexindent" },
					cmake = { "cmake_format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
			vim.keymap.set("n", "<Leader>;", function()
				require("conform").format({ lsp_format = "fallback" })
			end, { desc = "Format buffer" })
		end,
	},
}
