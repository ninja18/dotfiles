return {
	{
		"cdelledonne/vim-cmake",
		lazy = false,
		init = function()
			vim.g.cmake_link_compile_commands = 1
			vim.g.cmake_generate_options = {
				"-DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake",
			}
		end,
		config = function()
			local map = vim.keymap.set
			map("n", "<leader>cgr", ':call cmake#Generate(1, "Release")<CR>', { noremap = false, silent = true })
			map("n", "<leader>cgd", ':call cmake#Generate(1, "Debug")<CR>', { noremap = false, silent = true })
			map("n", "<leader>cb", "<Plug>(CMakeBuild)", { noremap = false, silent = true })
		end,
	},
}
