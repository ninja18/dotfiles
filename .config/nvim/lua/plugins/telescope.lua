return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "respect_case",
					},
				},
				defaults = {
					path_display = { "shorten" },
					file_ignore_patterns = { "node_modules", "patches", "build" },
				},
				pickers = {
					live_grep = {
						only_sort_text = true,
					},
					buffers = {
						show_all_buffers = true,
						sort_mru = true,
						mappings = {
							i = {
								["<c-x>"] = actions.delete_buffer + actions.move_to_top,
								["<c-b>"] = actions.select_horizontal,
							},
						},
					},
				},
			})
			pcall(require("telescope").load_extension, "fzf")

			local dropdown = function(fn, extra)
				return function()
					require("telescope.builtin")[fn](require("telescope.themes").get_dropdown(
						vim.tbl_extend("force", {
							previewer = false,
							layout_strategy = "horizontal",
							layout_config = {
								width = 0.5,
								height = 0.6,
								prompt_position = "top",
							},
						}, extra or {})
					))
				end
			end

			local map = vim.keymap.set
			map("n", "<leader><space>", dropdown("buffers"), { desc = "Find existing buffers" })
			map("n", "<leader>ff", dropdown("find_files"), { desc = "Find files" })
			map("n", "<leader>fw", function()
				require("telescope.builtin").grep_string()
			end, { desc = "Grep string in buffer" })
			map("n", "<leader>fg", function()
				require("telescope.builtin").grep_string({
					shorten_path = true,
					word_match = "-w",
					only_sort_text = true,
					search = "",
				})
			end, { desc = "Grep string in directory" })
			map("n", "<leader>fe", function()
				require("telescope.builtin").live_grep()
			end, { desc = "Live grep" })
			map("n", "<leader>fd", function()
				require("telescope.builtin").diagnostics()
			end, { desc = "Search diagnostics" })
			map("n", "<leader>f?", function()
				require("telescope.builtin").builtin()
			end, { desc = "Show builtin pickers" })
			map("n", "<leader>gs", function()
				require("telescope.builtin").git_status()
			end, { desc = "Git status" })
			map("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = false,
					})
				)
			end, { desc = "Fuzzy search in buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
