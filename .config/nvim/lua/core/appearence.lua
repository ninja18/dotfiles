require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		component_separators = "|",
		section_separators = "",
	},
	sections = {
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 2 },
		},
		lualine_x = { "diff", "diagnostics" },
		lualine_y = { "%l/%L" },
	},
})
