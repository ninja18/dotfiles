require('oil').setup {
  float = {
    padding = 2,
    max_width = 100,
    max_height = 200,
    border = "rounded",
    win_options = {
      winblend = 10,
    },
  },
}
vim.keymap.set("n", "-", require("oil").open_float, { desc = "Open parent directory" })

require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "right",
    width = 50,
  },
})
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.keymap.set('n', '<leader>nt', '<Cmd>Neotree toggle<CR>')

