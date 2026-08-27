return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			ls.config.setup({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
				update_events = "TextChanged,TextChangedI",
			})
			local snippet_path = vim.fn.stdpath("config") .. "/LuaSnip/"
			require("luasnip.loaders.from_lua").load({ paths = snippet_path })
			vim.keymap.set("", "<Leader>U", function()
				require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })
			end, { desc = "Reload LuaSnip snippets" })
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			snippets = { preset = "luasnip" },
			keymap = {
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				["<C-f>"] = { "scroll_documentation_up", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
	},
}
