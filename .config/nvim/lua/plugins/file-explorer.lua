return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				float = {
					padding = 2,
					max_width = 100,
					max_height = 200,
					border = "rounded",
					win_options = {
						winblend = 10,
					},
				},
			})
			vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })
		end,
	},
}
