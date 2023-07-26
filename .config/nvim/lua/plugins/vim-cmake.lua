vim.g.cmake_link_compile_commands = 1

vim.keymap.set('n', '<leader>cgr', ':call cmake#Generate(1, "Release")<CR>',{noremap = false, silent = true})
vim.keymap.set('n', '<leader>cgd', ':call cmake#Generate(1, "Debug")<CR>',{noremap = false, silent = true})
vim.keymap.set('n', '<leader>cb', '<Plug>(CMakeBuild)',{noremap = false, silent = true})
-- vim.keymap.set('n', '<leader>csr', '<Plug>(CMakeSwitch)',{noremap = false, silent = true})

