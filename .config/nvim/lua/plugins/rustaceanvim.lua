return {
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
		config = function()
			vim.g.rustaceanvim = {
				server = {
					on_attach = require("lsp.on_attach").on_attach,
				},
			}
		end,
	},
}
