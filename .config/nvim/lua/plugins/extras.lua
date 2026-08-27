return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
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
