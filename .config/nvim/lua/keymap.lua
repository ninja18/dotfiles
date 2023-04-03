vim.api.nvim_set_keymap('n','<leader>qf',[[<cmd>lua require'navigation'.toggle_quickfix_list(1)<CR>]],{noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<leader>qlf',[[<cmd>lua require'navigation'.toggle_quickfix_list(0)<CR>]],{noremap = true, silent = true})
