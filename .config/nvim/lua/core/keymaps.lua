local map = vim.keymap.set

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("i", ".", ".<c-g>u")
map("i", ",", ",<c-g>u")
map("i", "<CR>", "<CR><c-g>u")

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics in loclist" })
