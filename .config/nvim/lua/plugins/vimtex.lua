return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_quickfix_mode = 0
		end,
		config = function()
			vim.api.nvim_set_keymap(
				"i",
				"<C-f>",
				'<Esc>: exec \'.!inkscape-figures create "\'.getline(\'.\').\'" "\'.b:vimtex.root.\'/figures/"\'<cr><cr>:w<cr>',
				{ noremap = true, silent = true }
			)
		end,
	},
}
