return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		config = function(_, opts)
			require("trouble").setup(opts)
			vim.keymap.set("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble diagnostics" })
			vim.keymap.set("n", "<leader>xw", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble workspace diagnostics" })
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		opts = {},
	},
	{
		"rest-nvim/rest.nvim",
		build = false,
		dependencies = { "nvim-neotest/nvim-nio" },
	},
}
